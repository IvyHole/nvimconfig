-- 搜索插件
local telescoop_plugin = {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 
        'nvim-lua/plenary.nvim', 
        'nvim-telescope/telescope-fzf-native.nvim', build = "make",
    },
    config = function ()
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
                }
            }
        }
        require('telescope').load_extension('fzf')
    end
}
return telescoop_plugin

