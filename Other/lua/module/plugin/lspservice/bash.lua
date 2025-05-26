local bash_config =  {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh" },
}

return {
    require("lspconfig").bashls.setup(bash_config)
}