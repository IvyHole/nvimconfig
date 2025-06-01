return{
    {
    "echasnovski/mini.surround",
    version = "*",
    event = "BufReadPost",
    config = true,
    keys = {
      -- Disable the vanilla `s` keybinding
      { "s", "<NOP>", mode = { "n", "x", "o" } },
    },
  },
  {
    -- Extend `a`/`i` textobjects
    "echasnovski/mini.ai",
    version = "*",
    event = "BufReadPost",
    config = true,
  },
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    version = "*",
    opts = {},
  }
}