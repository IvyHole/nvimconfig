return{
    {
    "ibhagwan/smartyank.nvim",
    event = { "BufWinEnter" },
    opts = {
      highlight = {
        timeout = 500, -- timeout for clearing the highlight
      },
      clipboard = {
        enabled = true,
      },
      osc52 = {
        silent = true, -- true to disable the "n chars copied" echo
      },
    },
  },
}