return {
    {
        "uga-rosa/ccc.nvim",
        opts = {
            auto_enable = true,
            lsp = true,
            recognize = {
                -- input = true,
                -- output = true,
            },
        },
        keys = {
            {
                "<leader>c",
                "<Cmd>CccPick<Cr>"
            }
        },
    },
}
