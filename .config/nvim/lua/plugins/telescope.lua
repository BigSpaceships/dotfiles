return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,

        keys = {
            {
                "<leader>pf",
                function()
                require('telescope.builtin').find_files()
                end,
                desc = "Find file in directory"
            },
            {
                "<leader>pg",
                function()
                    require('telescope.builtin').live_grep()
                end,
                desc = "Find file using grep"
            },
            {
                "<C-p>",
                function()
                require('telescope.builtin').git_files()
                end,
                desc = "Find file in git"
            },
        }
    }
}
