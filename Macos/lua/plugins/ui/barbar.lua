return {{
    'romgrk/barbar.nvim',
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    lazy=false,
    keys = {
      { "<A-<>", "<CMD>BufferMovePrevious<CR>", mode = {"n"}, desc = "[Buffer] Move buffer left"  },
      { "<A->>", "<CMD>BufferMoveNext<CR>",     mode = {"n"}, desc = "[Buffer] Move buffer right" },
      { "<A-1>", "<CMD>BufferGoto 1<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 1"    },
      { "<A-2>", "<CMD>BufferGoto 2<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 2"    },
      { "<A-3>", "<CMD>BufferGoto 3<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 3"    },
      { "<A-4>", "<CMD>BufferGoto 4<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 4"    },
      { "<A-5>", "<CMD>BufferGoto 5<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 5"    },
      { "<A-6>", "<CMD>BufferGoto 6<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 6"    },
      { "<A-7>", "<CMD>BufferGoto 7<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 7"    },
      { "<A-8>", "<CMD>BufferGoto 8<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 8"    },
      { "<A-9>", "<CMD>BufferGoto 9<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 9"    },
      { "<A-h>", "<CMD>BufferPrevious<CR>",     mode = {"n"}, desc = "[Buffer] Previous buffer"   },
      { "<A-l>", "<CMD>BufferNext<CR>",         mode = {"n"}, desc = "[Buffer] Next buffer"       },
    },
    opts = {
      animation = false,
      -- Automatically hide the tabline when there are this many buffers left.
      -- Set to any value >=0 to enable.
      auto_hide = 1,

      -- Set the filetypes which barbar will offset itself for
      sidebar_filetypes = {
        NvimTree = true, -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      },
    },
  }}