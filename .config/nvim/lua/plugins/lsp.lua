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
                            location = '/usr/lib/node_modules/@vue/language-server',
                            languages = { 'vue' },
                            configNamespace = 'typescript',
                        },
                    },
                },
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            })

            vim.lsp.enable('ts_ls')
            vim.lsp.enable('vue_ls')
            vim.lsp.enable('pyright')
            vim.lsp.enable('rust_analyzer')
        end,
        keys = {
            {
                '<leader>M',
                function()
                    local file_name = vim.fn.expand('%')

                    vim.cmd('!tmux split-window -h -c ' .. vim.fn.getcwd())
                    vim.cmd('!tmux send-keys \'python ' .. file_name .. '\'')
                end,
                ft = 'python',
            }
        },
    },
    -- Autocompletion
}
