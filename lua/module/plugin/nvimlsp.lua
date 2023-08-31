local nvim_lsp = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "tamago324/nlsp-settings.nvim"
    },
    config = function()
        -- Set up lspconfig.
        require("module.plugin.lspservice.lua")
        require("module.plugin.lspservice.clangd")
        require("module.plugin.lspservice.json")
        require("module.plugin.lspservice.pyright")
        require("module.plugin.lspservice.yaml")
        require("module.plugin.lspservice.bash")

    end
}

return nvim_lsp
