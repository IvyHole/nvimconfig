return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },

      format_on_save = function(_)
        -- Disable with a global or buffer-local variable
        if vim.g.enable_autoformat then
          return { timeout_ms = 500, lsp_format = "fallback" }
        end
      end,
    },
    init = function()
      vim.g.enable_autoformat = false
      require("snacks").toggle
        .new({
          id = "auto_format",
          name = "Auto format",
          get = function()
            return vim.g.enable_autoformat
          end,
          set = function(state)
            vim.g.enable_autoformat = state
          end,
        })
        :map("<leader>tf")
    end,
  },
}

