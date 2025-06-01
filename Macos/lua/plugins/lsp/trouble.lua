return{
    {
    "folke/trouble.nvim",
    cmd = "Trouble",
    -- stylua: ignore
    keys = {
      { "<A-j>", function() vim.diagnostic.jump({ count = 1 }) end,  mode = {"n"},  desc = "Go to next diagnostic"                            },
      { "<A-k>", function() vim.diagnostic.jump({ count = -1 }) end, mode = {"n"},  desc = "Go to previous diagnostic"                        },
      { "<leader>gd", "<CMD>Trouble diagnostics toggle<CR>",                        desc = "[Trouble] Toggle buffer diagnostics"              },
      { "<leader>gs", "<CMD>Trouble symbols toggle focus=false<CR>",                desc = "[Trouble] Toggle symbols "                        },
      { "<leader>gl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", desc = "[Trouble] Toggle LSP definitions/references/...", },
      { "<leader>gL", "<CMD>Trouble loclist toggle<CR>",                            desc = "[Trouble] Location List"                          },
      { "<leader>gq", "<CMD>Trouble qflist toggle<CR>",                             desc = "[Trouble] Quickfix List"                          },

    --   -- { "grr", "<CMD>Trouble lsp_references focus=true<CR>",         mode = { "n" }, desc = "[Trouble] LSP references"                        },
    --   -- { "gD", "<CMD>Trouble lsp_declarations focus=true<CR>",        mode = { "n" }, desc = "[Trouble] LSP declarations"                      },
    --   -- { "gd", "<CMD>Trouble lsp_type_definitions focus=true<CR>",    mode = { "n" }, desc = "[Trouble] LSP type definitions"                  },
    --   -- { "gri", "<CMD>Trouble lsp_implementations focus=true<CR>",    mode = { "n" }, desc = "[Trouble] LSP implementations"                   },
    },

    specs = {
      "folke/snacks.nvim",
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          picker = {
            actions = require("trouble.sources.snacks").actions,
            win = {
              input = {
                -- stylua: ignore
                keys = {
                  ["<c-t>"] = { "trouble_open", mode = { "n", "i" }, },
                },
              },
            },
          },
        })
      end,
    },
    opts = {
      focus = false,
      warn_no_results = false,
      open_no_results = true,
      preview = {
        type = "float",
        relative = "editor",
        border = "rounded",
        title = "Preview",
        title_pos = "center",
        ---`row` and `col` values relative to the editor
        position = { 0.3, 0.3 },
        size = { width = 0.6, height = 0.5 },
        zindex = 200,
      },
    },

    config = function(_, opts)
      require("trouble").setup(opts)
      local symbols = require("trouble").statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        -- hl_group = "lualine_b_normal",
      })

      -- Insert status into lualine
      opts = require("lualine").get_config()
      table.insert(opts.winbar.lualine_b, 1, {
        symbols.get,
        cond = symbols.has,
      })
      require("lualine").setup(opts)
    end,
  },
}