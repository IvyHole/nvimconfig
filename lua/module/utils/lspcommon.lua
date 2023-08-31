local M = {}

local g_capabilities = vim.lsp.protocol.make_client_capabilities()
g_capabilities.textDocument.completion.completionItem.snippetSupport = true


M.capabilities = require("cmp_nvim_lsp").default_capabilities(g_capabilities)

return M
