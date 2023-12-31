local lspconfig = require("lspconfig")
local common = require("module.utils.lspcommon")
local l_capabilities = common.capabilities
l_capabilities.offsetEncoding = { "utf-16" }

local clangd_config = {
    capabilities = l_capabilities,
    single_file_support = true,
}

return {
    lspconfig.clangd.setup(clangd_config)
}
