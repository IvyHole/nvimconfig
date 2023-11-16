local lsp_installer = require "nvim-lsp-installer"

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
  lua_ls = "module.plugin.lspservice.lua", -- /lua/lsp/lua.lua
}

-- 自动安装 LanguageServers
for name, _ in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
        print("Installing " .. name)
        server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local opts = servers[server.name]
    if opts then
        require(opts)
    end
end)
