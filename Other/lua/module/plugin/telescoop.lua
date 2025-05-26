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
        { "nvim-tree/nvim-web-devicons" },
        { "debugloop/telescope-undo.nvim" },
		{
			"ahmedkhalf/project.nvim",
			event = { "CursorHold", "CursorHoldI" },
		},
		{ "jvgrootveld/telescope-zoxide" },
		 -- { "nvim-telescope/telescope-frecency.nvim" },
    },
    config = function ()
        local lga_actions = require("telescope-live-grep-args.actions")
        local icons = { ui = require("module.utils.icons").get("ui", true) }
        require("dir-telescope").setup({
            -- these are the default options set
            hidden = true,
            no_ignore = false,
            show_preview = true,
        })

        require("project_nvim").setup({
            manual_mode = false,
            detection_methods = { "lsp", "pattern" },
            patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
            ignore_lsp = { "null-ls", "copilot" },
            exclude_dirs = {},
            show_hidden = false,
            silent_chdir = true,
            scope_chdir = "global",
            datapath = vim.fn.stdpath("data"),
        })
            --[[
        local builtin = require('telescope.builtin').find_files,
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        --]]
        require('telescope').setup {
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
                initial_mode = "insert",
                prompt_prefix = " " .. icons.ui.Telescope .. " ",
                selection_caret = icons.ui.ChevronRight,
                scroll_strategy = "limit",
                results_title = false,
                layout_strategy = "horizontal",
                path_display = { "absolute" },
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                color_devicons = true,
                file_ignore_patterns = { ".git/", ".cache", "build/", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.85,
                    height = 0.92,
                    preview_cutoff = 120,
                },
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            },
            extensions = {
                fzf = {
                    fuzzy = false,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                --[[
                frecency = {
                    use_sqlite = false,
                    show_scores = true,
                    show_unindexed = true,
                    ignore_patterns = { "*.git/*", "*/tmp/*" },
                },
                -- ]]
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = { -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
                undo = {
                    side_by_side = true,
                    mappings = { -- this whole table is the default
                        i = {
                            -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                            -- you want to use the following actions. This means installing as a dependency of
                            -- telescope in it's `requirements` and loading this extension from there instead of
                            -- having the separate plugin definition as outlined above. See issue #6.
                            ["<cr>"] = require("telescope-undo.actions").yank_additions,
                            ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                            ["<C-cr>"] = require("telescope-undo.actions").restore,
                        },
                    },
                },
            },
        }
        -- require("telescope").load_extension("frecency")
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("notify")
        require("telescope").load_extension("projects")
        require("telescope").load_extension("undo")
        require("telescope").load_extension("zoxide")
	    require("telescope").load_extension("persisted")
        require("telescope").load_extension("dir")
    end
}
return telescoop_plugin

