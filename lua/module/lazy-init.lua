-- 加载lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim插件管理
require("lazy").setup({
    require("module.plugin.onedark"),
    require("module.plugin.nvimtree"),
    require("module.plugin.lualine"),
    require("module.plugin.undotree"),
    require("module.plugin.rainbow"),
    -- require("module.plugin.cocnvim"),
    -- require("module.plugin.neotree"),
    require("module.plugin.telescoop"),
    require("module.plugin.dashboard"),
    require("module.plugin.bufferline"),
    require("module.plugin.treesitter"),
    require("module.plugin.comment"),
    require("module.plugin.indentline"),
    require("module.plugin.symbolsoutline"),
    require("module.plugin.mason"),
    require("module.plugin.masonlsp"),
    require("module.plugin.nvimlsp"),
    require("module.plugin.nvimcmp"),
    require("module.plugin.gitsigns"),
    require("module.plugin.whichkey"),
    require("module.plugin.lspsaga"),
    require("module.plugin.nullls"),
    require("module.plugin.fidget"),
})
