local mason = {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
            -- PATH = "prepend", -- "skip" seems to cause the spawning error
        })
    end
}

return mason
