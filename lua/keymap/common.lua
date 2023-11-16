local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
    -- 复制粘贴操作
    ["n|<C-v>"] = map_cmd('"+p'):with_silent():with_desc("Nvim: Stickup From global"),
    ["i|<C-v>"] = map_cmd('<Esc> "+p'):with_silent():with_desc("Nvim: Stickup From global in insert mode"),
    ["v|<C-c>"] = map_cmd('+y'):with_silent():with_desc("Nvim: Copy to global"),
    ["i|<C-c>"] = map_cmd('<Esc>'):with_silent():with_desc("Nvim: Esc to normal mode in insert"),

    -- 分屏操作
    ["n|spl"] = map_cr('set splitright<CR>:vsplit'):with_silent():with_desc("Nvim: split right"),
    ["n|sph"] = map_cr('set nosplitright<CR>:vsplit'):with_silent():with_desc("Nvim: no split right"),
    ["n|spj"] = map_cr('set splitbelow<CR>:vsplit'):with_silent():with_desc("Nvim: split below"),
    ["n|spk"] = map_cr('set nosplitbelow<CR>:vsplit'):with_silent():with_desc("Nvim: no split below"),

}

bind.nvim_load_mapping(plug_map)