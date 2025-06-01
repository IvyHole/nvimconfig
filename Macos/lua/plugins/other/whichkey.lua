local whichkey_plugin = {{
    {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      ---@type false | "classic" | "modern" | "helix"
      preset = "helix",
      win = {
        -- no_overlap = true,
        title = false,
        width = 0.5,
      },
      -- stylua: ignore
      spec = {
        { "<leader>cc", group = "<CodeCompanion>", icon = "" },
        { "<leader>s",  group = "<Snacks>"                    },
        { "<leader>t",  group = "<Snacks> Toggle"             },
      },
      -- expand all nodes wighout a description
      expand = function(node)
        return not node.desc
      end,
    },
  }
}}

return whichkey_plugin
