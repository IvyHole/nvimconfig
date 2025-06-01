
-- 当前将快捷键写到自己的配置文件内,集中管理,此处只收录通用快捷键
local bind = require("keymap.bind")

local mapping = {
    ["i|<C-h>"] = bind.map_cmd("<Left>"):with_desc("Left"):with_silent(),
    ["i|<C-l>"] = bind.map_cmd("<Right>"):with_desc("Right"):with_silent(),
    ["i|<C-j>"] = bind.map_cmd("<Down>"):with_desc("Down"):with_silent(),
    ["i|<C-k>"] = bind.map_cmd("<Up>"):with_desc("Up"):with_silent(),

    ["n|<C-h>"] = bind.map_cmd("<C-w>h"):with_desc("Left"):with_silent(),
    ["n|<C-l>"] = bind.map_cmd("<C-w>l"):with_desc("Right"):with_silent(),
    ["n|<C-j>"] = bind.map_cmd("<C-w>j"):with_desc("Down"):with_silent(),
    ["n|<C-k>"] = bind.map_cmd("<C-w>k"):with_desc("Up"):with_silent(),

    ["nxo|<S-H>"] = bind.map_cmd("^"):with_desc("Nvim: Start of line"),
    ["nxo|<S-L>"] = bind.map_cmd("$"):with_desc("Nvim: End of line"),

    ["i|<C-c>"] = bind.map_cmd('<Esc>'):with_silent():with_desc("Nvim: Esc to normal mode in insert"),

    -- 分屏操作
    ["n|spl"] = bind.map_cr('set splitright<CR>:vsplit'):with_silent():with_desc("Nvim: split right"),
    ["n|sph"] = bind.map_cr('set nosplitright<CR>:vsplit'):with_silent():with_desc("Nvim: no split right"),
    ["n|spj"] = bind.map_cr('set splitbelow<CR>:vsplit'):with_silent():with_desc("Nvim: split below"),
    ["n|spk"] = bind.map_cr('set nosplitbelow<CR>:vsplit'):with_silent():with_desc("Nvim: no split below"),

}

bind.nvim_load_mapping(mapping)