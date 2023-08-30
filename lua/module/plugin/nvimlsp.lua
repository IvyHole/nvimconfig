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
    config = function()
        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
            -- capabilities = capabilities
        -- }
        require("lspconfig").lua_ls.setup{
            -- on_attach = on_attach
            capabilities = capabilities
        }
        require("lspconfig").clangd.setup{
            capabilities = capabilities
        }
        require("lspconfig").jsonls.setup{}
        require("lspconfig").pyright.setup{
            capabilities = capabilities
        }
        require("lspconfig").yamlls.setup{}
        require("lspconfig").bashls.setup{}
    end
}

return nvim_lsp
