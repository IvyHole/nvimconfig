local dashboard_plugin = {
    'glepnir/dashboard-nvim',   
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
              -- config
            theme = 'doom',
            config = {
                header = {
                    --[[
                    '',
                    '',
                    '',
                    ' ███▄ ▄███▓▓██   ██▓    ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓   ',
                    '▓██▒▀█▀ ██▒ ▒██  ██▒    ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒   ',
                    '▓██    ▓██░  ▒██ ██░   ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░   ',
                    '▒██    ▒██   ░ ▐██▓░   ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██    ',
                    '▒██▒   ░██▒  ░ ██▒▓░   ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒   ',
                    '░ ▒░   ░  ░   ██▒▒▒    ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░   ',
                    '░  ░      ░ ▓██ ░▒░    ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░   ',
                    '░      ░    ▒ ▒ ░░        ░   ░ ░     ░░   ▒ ░░      ░      ',
                    '       ░    ░ ░                 ░      ░   ░         ░      ',
                    '            ░ ░                       ░                     ',
                    '',
                    '',
                    '',
                    ]]
                    '',
                    '',
                    '',
                    '⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑',
                    '⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐',
                    '⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐',
                    '⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀',
                    '⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇',
                    '⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰',
                    '⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕',
                    '⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵',
                    '⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿',
                    '⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿',
                    '⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿',
                    '⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀',
                    '⣿⣿⣿⢻⣿⣿⣿⣿⠻⣿⣿⡿⠿⠿⠿⣿⠻⡿⠻⠿⣿⡟⠛⠛⢛⣿⣿',
                    '⣿⠏⣼⢸⡄⢿⢋⢸⣷⣇⢻⣿⣿⣿⣿⣿⡗⣥⠂⢦⣿⣭⢩⡍⣭⣽⣿',
                    '⣿⣾⣛⣸⣿⣾⣾⣈⣛⣠⣿⣤⣤⣤⣤⣼⣴⣫⣶⣌⣻⣋⣼⣇⣋⣼⣿',
                    '',
                    '',
                    '',
                }, --your header
                center = {
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Find File           ',
                        desc_hl = 'String',
                        key = 'b',
                        keymap = '<leader> f f',
                        key_hl = 'Number',
                        action = require('telescope.builtin').find_files
                    },
                    {
                        icon = ' ',
                        desc = 'Find buffer file',
                        desc_hl = 'String',
                        key = 'f',
                        keymap = '<leader> f b',
                        key_hl = 'Number',
                        action = require('telescope.builtin').buffers
                    },
                    {
                        icon = ' ',
                        desc = 'Find session',
                        desc_hl = 'String',
                        key = 'l',
                        keymap = '<leader> l s',
                        key_hl = 'Number',
                        action = require('telescope.builtin').buffers
                    },
					{
                        icon = ' ',
                        desc = 'Scheme change',
                        desc_hl = 'String',
                        key = 'c',
                        keymap = '<leader> f c',
                        key_hl = 'Number',
                        action = require("telescope.builtin").colorscheme
                    },
                },
                footer = {}  --your footer
            },
        }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

return dashboard_plugin

