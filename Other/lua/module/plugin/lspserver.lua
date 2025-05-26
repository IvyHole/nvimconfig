local lspserver= {
    vim.lsp.start({
        name = 'lua_ls',
        cmd = {"lua-language-server"},
        root_dir = vim.fs.dirname(vim.fs.find({".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"}, { upward = true })[1]),
    })
}

return lspserver
