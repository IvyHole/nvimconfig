local whichkey_plugin = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function ()
        local icons = {
            ui = require("module.utils.icons").get("ui"),
            misc = require("module.utils.icons").get("misc"),
        }
        require("which-key").setup{
            plugins = {
                presets = {
                    operators = false,
                    motions = false,
                    text_objects = false,
                    windows = false,
                    nav = false,
                    z = true,
                    g = true,
                },
            },

            icons = {
                breadcrumb = icons.ui.Separator,
                separator = icons.misc.Vbar,
                group = icons.misc.Add,
            },

            window = {
                border = "none",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 1, 1, 1, 1 },
                winblend = 0,
            },
        }
    end
}

return whichkey_plugin
