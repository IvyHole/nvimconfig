local lspsaga_plugin = {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
    },
    config = function()
        require('lspsaga').setup({
    -- Breadcrumbs: https://dev.neovim.pro/lspsaga/breadcrumbs/
            symbol_in_winbar = {
                enable = true,
                hide_keyword = false,
                show_file = false,
                folder_level = 1,
                color_mode = true,
                delay = 100,
            },
            -- https://dev.neovim.pro/lspsaga/codeaction/
            code_action = {
                num_shortcut = true,
                only_in_cursor = false,
                show_server_name = true,
                extend_gitsigns = false,
                keys = {
                    quit = "q",
                    exec = "<CR>",
                },
            },
            -- https://dev.neovim.pro/lspsaga/diagnostic/
            diagnostic = {
                show_code_action = true,
                jump_num_shortcut = true,
                max_width = 0.5,
                max_height = 0.6,
                text_hl_follow = true,
                border_follow = true,
                extend_relatedInformation = true,
                show_layout = "float",
                show_normal_height = 10,
                max_show_width = 0.9,
                max_show_height = 0.6,
                diagnostic_only_current = false,
                keys = {
                    exec_action = "r",
                    quit = "q",
                    toggle_or_jump = "<CR>",
                    quit_in_show = { "q", "<Esc>" },
                },
            },
            -- https://dev.neovim.pro/lspsaga/hover/
            hover = {
                max_width = 0.45,
                max_height = 0.7,
                --open_link = "gl",
                --open_cmd = "silent !" .. require("core.settings").external_browser,
            },
            -- https://dev.neovim.pro/lspsaga/implement/
            implement = {
                enable = true,
                sign = true,
                virtual_text = false,
                priority = 100,
            },
            -- https://dev.neovim.pro/lspsaga/lightbulb/
            lightbulb = {
                enable = false,
                sign = true,
                virtual_text = false,
                debounce = 10,
                sign_priority = 20,
            },
            -- https://dev.neovim.pro/lspsaga/rename/
            rename = {
                in_select = false,
                auto_save = false,
                project_max_width = 0.5,
                project_max_height = 0.5,
                keys = {
                    quit = "<C-c>",
                    exec = "<CR>",
                    select = "x",
                },
            },
            -- https://dev.neovim.pro/lspsaga/misc/#beacon
            beacon = {
                enable = true,
                frequency = 12,
            },
        })
    end
}

return lspsaga_plugin
