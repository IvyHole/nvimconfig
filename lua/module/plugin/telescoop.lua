-- 搜索插件
local telescoop_plugin = {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 
        'nvim-lua/plenary.nvim', 
        'nvim-telescope/telescope-fzf-native.nvim',
        { 
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
        "princejoogie/dir-telescope.nvim",
    },
    config = function ()
        local lga_actions = require("telescope-live-grep-args.actions")
        require("dir-telescope").setup({
            -- these are the default options set
            hidden = true,
            no_ignore = false,
            show_preview = true,
        })
            --[[
        local builtin = require('telescope.builtin').find_files,
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        --]]
        require('telescope').setup {
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                },
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = { -- extend mappings
                        i = {
                        ["<C-k>"] = lga_actions.quote_prompt(),
                        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                }
            }
        }
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('projects')
        require("telescope").load_extension("notify")
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("dir")
    end
}
return telescoop_plugin

