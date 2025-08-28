return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                {
                    section = "keys",
                    gap = 1,
                    padding = 1,
                },
                -- {
                --     icon = " ",
                --     title = "Projects",
                --     section = "projects",
                --     gap = 1,
                --     padding = 1,
                -- },
                { section = "startup" },
            },
        },
        indent = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            "<leader>d",
            function()
                Snacks.dashboard()
            end,
            desc = "open dashboard"
        },
        {
            "<leander>N",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "show history"
        },
    }
}
