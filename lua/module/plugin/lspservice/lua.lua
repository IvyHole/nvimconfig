local util = require("lspconfig.util")
local common = require("module.utils.lspcommon")
local lspconfig = require("lspconfig")
local root_files = {
    "project.md",
}
local lualsp_config = {
    root_dir = function(fname)
            return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = {
                    '?.lua',
                    '?/init.lua',
                },
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
                print("set lua settings here")
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    -- vim.api.nvim_get_runtime_file("", true),
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                }
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            },
        },
    },
    capabilities = common.capabilities,
}
return {
        require("neodev").setup{
            library = {
                enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
                types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
                plugins = true, -- installed opt or start plugins in packpath
            },
        },
        -- 在neodev之后加载 see: https://github.com/folke/neodev.nvim#-setup
        lspconfig.lua_ls.setup(lualsp_config)
        
}
