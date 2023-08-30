--[[
local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end
--]]
local nvim_lsp = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "tamago324/nlsp-settings.nvim"
    },
    config = function()
        local lspconfig = require("lspconfig")
        local nlspsettings = require("nlspsettings")
        
        --[[
        nlspsettings.setup({
            config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
            local_settings_dir = ".nlsp-settings",
            local_settings_root_markers_fallback = { '.git' },
            append_default_schemas = true,
            loader = 'json'
        })
        --]]
        -- Set up lspconfig.
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        -- local cmp_nvim_lsp = require("cmp_nvim_lsp").update_capabilities(capabilities)
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
            -- capabilities = capabilities
        -- }
        lspconfig.lua_ls.setup{
            -- on_attach = on_attach
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                    client.config.settings = vim.tbl_deep_extend(
                        'force',
                        client.config.settings.Lua,
                        require("module.plugin.lspservice.luals")
                    )
                    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
                return true
            end,
                    }
        lspconfig.clangd.setup{
            capabilities = capabilities
        }
        lspconfig.jsonls.setup{}
        lspconfig.pyright.setup{
            capabilities = capabilities
        }
        lspconfig.yamlls.setup{}
        lspconfig.bashls.setup{
            require("module.plugin.lspservice.bashls")
        }
    end
}

return nvim_lsp
