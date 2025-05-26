---@diagnostic disable: missing-fields
local treesitter_plugin = {
    "nvim-treesitter/nvim-treesitter",
      lazy = true,
    build = function()
      if #vim.api.nvim_list_uis() ~= 0 then
        vim.api.nvim_command("TSUpdate")
      end
    end,
    event = "BufReadPost",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "mfussenegger/nvim-treehopper" },
        { "andymass/vim-matchup" },
        {
          "hiphish/rainbow-delimiters.nvim",
        },
        {
          "nvim-treesitter/nvim-treesitter-context",
        },
        {
          "windwp/nvim-ts-autotag",
        },
        {
          "NvChad/nvim-colorizer.lua",
        },
        {
          "abecodes/tabout.nvim",
        },
    },
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "lua", "python", "bash", "cpp", "diff", "proto", "markdown", "markdown_inline"},
            sync_install = false,
            auto_install = false,
            ignore_install = { "javascript" },
             highlight = {
                enable = true,

                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                          return true
                     end
                 end,
                additional_vim_regex_highlighting = {"c", "cpp"},
            },
        }

        local function init_strategy(threshold)
          return function()
            local errors = 200
            vim.treesitter.get_parser():for_each_tree(function(lt)
              if lt:root():has_error() and errors >= 0 then
                errors = errors - 1
              end
            end)
            if errors < 0 then
              return nil
            end
            return vim.fn.line("$") > threshold and require("rainbow-delimiters").strategy["global"]
              or require("rainbow-delimiters").strategy["local"]
          end
        end
      
        vim.g.rainbow_delimiters = {
          strategy = {
            [""] = init_strategy(500),
            c = init_strategy(200),
            cpp = init_strategy(200),
            lua = init_strategy(500),
            vimdoc = init_strategy(300),
            vim = init_strategy(300),
          },
          query = {
            [""] = "rainbow-delimiters",
            latex = "rainbow-blocks",
            javascript = "rainbow-delimiters-react",
          },
          highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterOrange",
            "RainbowDelimiterYellow",
            "RainbowDelimiterGreen",
            "RainbowDelimiterBlue",
            "RainbowDelimiterCyan",
            "RainbowDelimiterViolet",
          },
        }

        require("treesitter-context").setup({
          enable = true,
          max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
          min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
          line_numbers = true,
          multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
          trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
          mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
          zindex = 30,
        })

        require("nvim-ts-autotag").setup({
          filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "xml",
          },
        })
        require("colorizer").setup()
        require("tabout").setup({
          tabkey = "", -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable
          act_as_tab = true, -- shift content if tab out is not possible
          act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
          enable_backwards = true,
          completion = true, -- if the tabkey is used in a completion pum
          tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
          },
          ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
          exclude = {}, -- tabout will ignore these filetypes
        })


    end
}

return treesitter_plugin
