local treesitterPlugin = {
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          auto_install = true,
          ensure_installed = { 
            "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html",
            "cpp", "python", "diff", "proto", "markdown", "markdown_inline", "bash"
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }
}

return treesitterPlugin