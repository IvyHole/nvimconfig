local cmp_plugin = {
     -- nvim-cmp
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp }
        'hrsh7th/cmp-buffer',   -- { name = 'buffer' },
        'hrsh7th/cmp-path',     -- { name = 'path' }
        'hrsh7th/cmp-cmdline',  -- { name = 'cmdline' }
        'hrsh7th/nvim-cmp',
        -- luasnip
        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                'rafamadriz/friendly-snippets',
            }
        },
        'saadparwaiz1/cmp_luasnip',
        -- lspkind
        'onsails/lspkind-nvim',
    },
    config = function()
        local lspkind = require('lspkind')
        local cmp = require'cmp'

        cmp.setup({
            print("running cmp setup"),
            -- snipprt引擎
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
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
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                },
                {
                    { name = 'buffer' },
                    { name = 'path' },
                }
            ),
            formatting = {
                format = lspkind.cmp_format({
                with_text = true, -- do not show text alongside icons
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                before = function (entry, vim_item)
                    -- Source 显示提示来源
                    vim_item.menu = "["..string.upper(entry.source.name).."]"
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

