local common = require("module.utils.lspcommon")
-- load session
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
-- 定义<session-file> 所在目录
local sessionDir = vim.fn.stdpath("data") .. "\\vimSession\\"

-- 删除选中session
local function delete_selection(prompt_bufnr, map)
    -- 关闭Prompt buffer
    actions.close(prompt_bufnr)
    -- 获取结果列表
    local selection = action_state.get_selected_entry()
    -- rm <session-file> 删除选中的session file
    vim.cmd([[!rm ]] .. sessionDir .. selection[1])
end

-- 进入选中session
local function load_session(prompt_bufnr)
    actions.close(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    -- source session  :source <session-file>
    vim.cmd([[:source ]] .. selection[1])
    require("notify")("load session from " .. selection[1])
end

local function save_session(value)
   -- print(value)
    if value == "" or value == nil then
        require("notify")("No Session Name", "error")
        return
    end
    vim.cmd([[:!mksession ]] .. sessionDir .. value)
    require("notify")("Save session in " .. sessionDir ..value)
end

local _save_session = function()
    local opts = {
        desc = "Save Session",
        border = {
            text = {
                top = "Enter Session Name :",
            },
        },
    }
    common.trigger_set_input(save_session, opts)
end
  

local _manage_session = function()
    local opts = {
        -- 绑定Actions到Mappings
        -- attach_mappings绑定的键位映射只生效于telescope的buffer，不影响全局
        attach_mappings = function(_, map)
            -- <enter>键 进入选中session
            map("n", "<cr>", load_session)
            map("i", "<cr>", load_session)
            -- d键 删除选中session
            map("n", "d", delete_selection)
            return true
        end,
        -- 定义Finder的查找命令为ls <session-file所在的目录>
        -- find_command = {
        --     "dir",
        --     "/b",
        --     vim.fn.stdpath("data") .. "\\vimSession\\",
        -- },
        prompt_title = "Manage session",
        search_dirs = {
            vim.fn.stdpath("data") .. "\\vimSession\\",
        },
    }
    require("notify")("find_command: dir /b " .. sessionDir)

    require("telescope.builtin").find_files(opts)
end

-- 全局键位映射，映射<space>s键为打开telescope会话管理
vim.keymap.set("n", "<space>ls", _manage_session)
--vim.keymap.set("n", "<space>ss", _manage_session)
-- 将telescope会话管理包装为用户定义命令
vim.api.nvim_create_user_command("LoadSession", _manage_session, { desc = "load user session,like workspace" })
vim.api.nvim_create_user_command("SaveSession", _save_session, {desc = "save user session"})
