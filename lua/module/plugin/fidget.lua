local fidget_plugin = {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = function ()
        require("fidget").setup()
    end,
    opts = {
       
    },
}

return fidget_plugin
