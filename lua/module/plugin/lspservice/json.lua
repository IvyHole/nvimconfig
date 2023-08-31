local json_config = {

}

return {
    require("lspconfig").jsonls.setup(json_config)
}