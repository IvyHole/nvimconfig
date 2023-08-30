-- nvim状态栏
local lualine_plugin = {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup()
    end
}
return lualine_plugin
