return {
    {
        "folke/lazydev.nvim",
        ft = "lua"
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    }
                }
            })

            vim.lsp.enable('lua_ls')

            vim.lsp.config('ts_ls', {
                init_options = {
                    plugins = {
                        {
                            name = '@vue/typescript-plugin',
                            location = os.execute('which vue-language-server'),
                            languages = { 'vue' },
                            configNamespace = 'typescript',
                        },
                    },
                },
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            })

            vim.lsp.enable('ts_ls')
            vim.lsp.enable('vue_ls')
        end,
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
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

    -- LSP
    -- {
    --     'neovim/nvim-lspconfig',
    --     cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    --     event = { 'BufReadPre', 'BufNewFile' },
    --     dependencies = {
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'williamboman/mason.nvim' },
    --         { 'williamboman/mason-lspconfig.nvim' },
    --     },
    --     init = function()
    --         -- Reserve a space in the gutter
    --         -- This will avoid an annoying layout shift in the screen
    --         vim.opt.signcolumn = 'yes'
    --     end,
    --     config = function()
    --         local lsp_defaults = require('lspconfig').util.default_config
    --
    --         -- Add cmp_nvim_lsp capabilities settings to lspconfig
    --         -- This should be executed before you configure any language server
    --         lsp_defaults.capabilities = vim.tbl_deep_extend(
    --             'force',
    --             lsp_defaults.capabilities,
    --             require('cmp_nvim_lsp').default_capabilities()
    --         )
    --
    --         -- LspAttach is where you enable features that only work
    --         -- if there is a language server active in the file
    --         vim.api.nvim_create_autocmd('LspAttach', {
    --             desc = 'LSP actions',
    --             callback = function(event)
    --                 local opts = { buffer = event.buf }
    --
    --                 vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    --                 vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    --                 vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    --                 vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    --                 vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    --                 vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    --                 vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    --                 vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    --                 vim.keymap.set('n', "<leader>f", '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    --                 vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    --             end,
    --         })
    --
    --         require('mason-lspconfig').setup({
    --             ensure_installed = {},
    --             handlers = {
    --                 -- this first function is the "default handler"
    --                 -- it applies to every language server without a "custom handler"
    --                 function(server_name)
    --                     require('lspconfig')[server_name].setup({})
    --                 end,
    --             }
    --         })
    --
    --         -- TODO: make this only apply in vue projects
    --
    --         local mason_registry = require('mason-registry')
    --         local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
    --         '/node_modules/@vue/language-server'
    --
    --         local lspconfig = require('lspconfig')
    --
    --         lspconfig.ts_ls.setup {
    --             init_options = {
    --                 plugins = {
    --                     {
    --                         name = '@vue/typescript-plugin',
    --                         location = vue_language_server_path,
    --                         languages = { 'vue' },
    --                     },
    --                 },
    --             },
    --             filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    --         }
    --
    --         -- No need to set `hybridMode` to `true` as it's the default value
    --         lspconfig.volar.setup {}
    --     end
    -- }
}
