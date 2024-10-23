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
                "<C-p>",
                function()
                require('telescope.builtin').git_files()
                end,
                desc = "Find file in git"
            },
        }
    }
}
