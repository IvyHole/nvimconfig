local scrollbar = {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "kevinhwang91/nvim-hlslens"
    },
    config = function ()
        require('hlslens').setup()
        local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
    handle = {
        color = colors.bg_highlight,
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    }
})
        require("scrollbar").setup({
            show = true,
            show_in_active_only = false,
            set_highlights = true,
            folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
            max_lines = false, -- disables if no. of lines in buffer exceeds this
            hide_if_all_visible = false, -- Hides everything if all lines are visible
            throttle_ms = 100,
            handle = {
                text = " ",
                blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
                color = colors.bg_highlight,
                color_nr = nil, -- cterm
                highlight = "CursorColumn",
                hide_if_all_visible = true, -- Hides handle if all lines are visible
            },
            marks = {
                Search = { color = colors.orange },
                Error = { color = colors.error },
                Warn = { color = colors.warning },
                Info = { color = colors.info },
                Hint = { color = colors.hint },
                Misc = { color = colors.purple },
            },
            excluded_buftypes = {
                "terminal",
            },
            excluded_filetypes = {
                "cmp_docs",
                "cmp_menu",
                "noice",
                "prompt",
                "TelescopePrompt",
            },
            autocmd = {
                render = {
                    "BufWinEnter",
                    "TabEnter",
                    "TermEnter",
                    "WinEnter",
                    "CmdwinLeave",
                    "TextChanged",
                    "VimResized",
                    "WinScrolled",
                },
                clear = {
                    "BufWinLeave",
                    "TabLeave",
                    "TermLeave",
                    "WinLeave",
                },
            },
            handlers = {
                cursor = true,
                diagnostic = true,
                gitsigns = false, -- Requires gitsigns
                handle = true,
                search = false, -- Requires hlslens
                ale = false, -- Requires ALE
            },
        })
    end

}

return scrollbar
