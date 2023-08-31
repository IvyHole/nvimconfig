local map = vim.api.nvim_set_keymap
local silents = {noremap = true, silent = true }
local normal_opt = {}

-- map("n", "<A-m>", ":Neotree<CR>", silents) -- neotree-tree 切换
map("n", "<A-m>", ":NvimTreeOpen<CR>", silents) -- nvimtree-tree 切换
map("n", "<F5>", ":UndotreeToggle<CR>", silents)   -- undotree

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, normal_opt)
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, normal_opt)
vim.keymap.set('n', '<leader>fb', builtin.buffers, normal_opt)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, normal_opt)
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", silents)
vim.keymap.set("n", "<leader>fd", "<cmd>GrepInDirectory<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pd", "<cmd>FileInDirectory<CR>", { noremap = true, silent = true })

map("n", "<A-o>", ":Lspsaga outline<CR>", silents)

map("n", "<A-l>", ":Gitsigns toggle_current_line_blame<CR>", silents)

--bufferline相关
map("n", "<leader>j", ":BufferLineCyclePrev<CR>", silents)
map("n", "<leader>k", ":BufferLineCycleNext<CR>", silents)
map("n", "<leader>cl", ":BufferLineCloseLeft<CR>", silents)
map("n", "<leader>cr", ":BufferLineCloseRight<CR>", silents)
map("n", "<leader>ca", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", silents)

