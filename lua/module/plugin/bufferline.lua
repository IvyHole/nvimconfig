local buffline_plugin = {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true,
        require('bufferline').setup{
            options = {
                number = "ordinal",
                max_name_length = 20,
                max_prefix_length = 13,
                tab_size = 20,
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                enforce_regular_tabs = false,
                persist_buffer_sort = true,
                always_show_bufferline = true,
                separator_style = "slant",
                
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count)
                    return "(" .. count .. ")"
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        padding = 0,
                    },
                    {
                        filetype = "Outline",
                        text = "Symbol Outline",
                        text_align = "center",
                        padding = 0,
                    },
                },
            }
        }
    end
}
return buffline_plugin
