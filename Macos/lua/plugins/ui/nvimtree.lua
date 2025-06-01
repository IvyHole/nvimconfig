return{
    {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>m", "<CMD>NvimTreeToggle<CR>", mode = { "n" }, desc = "[NvimTree] Toggle NvimTree" },
    },
    opts = {}
  }
}