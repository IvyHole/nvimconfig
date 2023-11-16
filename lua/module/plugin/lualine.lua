-- nvim状态栏
local lualine_plugin = {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup{
			options = {
				-- ... your lualine config
				theme = 'tokyonight'
				-- ... your lualine config
			}
		}
	end
}
return lualine_plugin
