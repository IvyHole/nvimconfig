local cmp_plugin = {
     -- nvim-cmp
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp }
        'hrsh7th/cmp-buffer',   -- { name = 'buffer' },
        'hrsh7th/cmp-path',     -- { name = 'path' }
        'hrsh7th/cmp-cmdline',  -- { name = 'cmdline' }
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lua',
        -- luasnip
        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                'rafamadriz/friendly-snippets',
            },
        },
        'saadparwaiz1/cmp_luasnip',
        -- lspkind
        'onsails/lspkind-nvim',
        { "lukas-reineke/cmp-under-comparator" },
        { "andersevenrud/cmp-tmux" },
        { "f3fora/cmp-spell" },
        { "kdheepak/cmp-latex-symbols" },
        { "ray-x/cmp-treesitter", commit = "c8e3a74" },
    },
    config = function()
        local lspkind = require('lspkind')
        local cmp = require('cmp')

        local border = function(hl)
            return {
                { "┌", hl },
                { "─", hl },
                { "┐", hl },
                { "│", hl },
                { "┘", hl },
                { "─", hl },
                { "└", hl },
                { "│", hl },
            }
        end

        cmp.setup({
            --print("running cmp setup"),
            -- snipprt引擎
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    border = border("PmenuBorder"),
                    winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
                    scrollbar = false,
                },
                documentation = {
                    border = border("CmpDocBorder"),
                    winhighlight = "Normal:CmpDoc",
                },
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                --['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources(
                {
                    { name = "nvim_lsp"},
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "treesitter" },
                    { name = "spell" },
                    { name = "tmux" },
                    { name = "orgmode" },
                    { name = "buffer" },
                    { name = "latex_symbols" },
                }
            ),
            formatting = {
                format = lspkind.cmp_format({
                with_text = true, -- do not show text alongside icons
                max_width = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                max_height = 20,
                before = function (entry, vim_item)
                    -- Source 显示提示来源
                    vim_item.menu = setmetatable({
                        cmp_tabnine = "[TN]",
                        buffer = "[BUF]",
                        orgmode = "[ORG]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[LUA]",
                        path = "[PATH]",
                        tmux = "[TMUX]",
                        treesitter = "[TS]",
                        latex_symbols = "[LTEX]",
                        luasnip = "[SNIP]",
                        spell = "[SPELL]",
                    }, {
                        __index = function()
                            return "[BTN]" -- builtin/unknown source names
                        end,
                    })[entry.source.name]
                    return vim_item
                end
                })
            },
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
            { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
            { name = 'path' }
            }, {
            { name = 'cmdline' }
            })
        })
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
return cmp_plugin

