local lspconfig = require("lspconfig")
local common = require("module.utils.lspcommon")
local pyright_config =  {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    },
    capabilities = common.capabilities,
}

return {
    lspconfig.pyright.setup(pyright_config)
}
