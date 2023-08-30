-- onedark主题
local onedark_theme = {
    'navarasu/onedark.nvim',
    config = function()
        require('onedark').setup {
            style = 'darker'
        }
        require('onedark').load()
    end
}
return onedark_theme
