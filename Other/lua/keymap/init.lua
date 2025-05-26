require("keymap.helpers")
local bind = require("keymap.bind")

-- 配置leader按键
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Plugin keymaps
require("keymap.completion") -- lsp专用
require("keymap.common") -- nvim/vim原生
require("keymap.plugin") -- 插件
require("keymap.gitsigns") -- git标记专用
require("keymap.autocmd") -- autocmd

