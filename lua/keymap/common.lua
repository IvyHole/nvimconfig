local map = vim.api.nvim_set_keymap
local silents = {noremap = true, silent = true }
local normal_opts = {}

-- 配置leader按键
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- map("n", "<A-R>", ":source $MYVIMRC", normal_opts) -- 刷新lua
map("n", "<C-v>", '"+p', normal_opts)              -- 粘贴
map("i", "<C-v>", '<Esc> "+p ', normal_opts) 
map("v", "<C-c>", '"+y', normal_opts)              -- 复制
map("i", "<C-c>", "<ESC>", normal_opts)            -- 编辑模式退出
-- map("n", "<C-s>", ": w<CR>", normal_opts)              -- 普通模式保存
-- map("i", "<C-s>", "<ESC> : w<CR>", normal_opts)              -- 编辑模式保存
-- map("n", "<C-F>", ":NvimTreeFindFile<CR>", normal_opts)       -- ctrl+F


---[[ 分屏相关操作
map("n", "spl", ":set splitright<CR>:vsplit<CR>", silents)
map("n", "sph", ":set nosplitright<CR>:vsplit<CR>", silents)
map("n", "spj", ":set splitbelow<CR>:vsplit<CR>", silents)
map("n", "spk", ":set nosplitbelow<CR>:vsplit<CR>", silents)

map("n", "<A-h>", "<C-w>h", silents)
map("n", "<A-j>", "<C-w>j", silents)
map("n", "<A-k>", "<C-w>k", silents)
map("n", "<A-l>", "<C-w>l", silents)
--]]

---[[ table相关操作
map("n", "tu", ":tabe<CR>", silents) --增加table
map("n", "tc", ":tabc<CR>", silents) --删除table
map("n", "tp", ":-tabnext<CR>", silents)
map("n", "tn", ":+tabnext<CR>", silents)
map("n", "tmn", ":-tabmove<CR>", silents)
map("n", "tmi", ":+tabmove<CR>", silents)
--]]

require("keymap.plugin")
require("keymap.autocmd")
