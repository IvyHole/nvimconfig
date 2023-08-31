---@diagnostic disable: missing-fields
local buffline_plugin = {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local icons = { ui = require("module.utils.icons").get("ui"),}
        require("bufferline").setup({
            options = {
                close_command = "Bdelete! %d",
                middle_mouse_command = function()
                    require("bufferline").sort_buffers_by(function(buf_a, buf_b)
                        return buf_a.id < buf_b.id
                    end)
                end,
                right_mouse_command = "Bdelete! %d",
                number = nil,
                modified_icon = icons.ui.Modified,
                buffer_close_icon = icons.ui.Close,
                left_trunc_marker = icons.ui.Left,
                right_trunc_marker = icons.ui.Right,
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
                        -- 🧶 🧵 💯 🗒︎ 🗓️
                        text = "🗂️ File Explorer",
                        highlight = "BufferlineCustomeNvimtree",
                        text_align = "left",
                        separator = true,
                    },
                    {
                        filetype = "lspsagaoutline",
                        text = "🧵 outline",
                        highlight = "BufferlineCustomeNvimtree",
                        text_align = "right",
                    },
                    {
                        filetype = "Outline",
                        highlight = "BufferlineCustomeNvimtree",
                        text = "💯 outline",
                        text_align = "right",
                    },
                    {
                        filetype = "undotree",
                        highlight = "BufferlineCustomeNvimtree",
                        text = "🧶 undo Tree",
                        text_align = "left",
                    },
                },
            },
        })
    end
}
return buffline_plugin
