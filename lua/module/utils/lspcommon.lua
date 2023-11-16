local M = {}
local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local g_capabilities = vim.lsp.protocol.make_client_capabilities()
g_capabilities.textDocument.completion.completionItem.snippetSupport = true


M.capabilities = require("cmp_nvim_lsp").default_capabilities(g_capabilities)

local stored_task_command = nil
---[[
M.trigger_set_input = function(callback_fn, opts)
    local input_component = Input({
        position = "50%",
        size = {
            width = 50,
        },
        border = {
            style = "single",
            text = {
                top = opts.border.text.top or "A Top Text",
                top_align = opts.border.text.top_align or "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
    }, {
        prompt = "> ",
        default_value = "",
        keymap = {
            close = { "<Esc>", "<C-c>" },
        },
        on_submit = function(value)
        --stored_task_command = value
            if value ~= nil then
                callback_fn(value)
            end
        end,
        on_close = function()
            require("notify")(opts.desc or "Close Enter!")
        end,
    })

    input_component:mount()
    input_component:on(event.BufLeave, function()
        input_component:unmount()
    end)
end
--]]

return M
