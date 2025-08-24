return {
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        config = function()
            local cmp = require('cmp')

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                sources = {
                    {
                        name = 'nvim_lsp'
                    },
                    {
                        name = 'luasnip'
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-b>'] = cmp.mapping.select_next_item(cmp_select),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
    },
}
