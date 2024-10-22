return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,

        keys = {
            {
                "<leader>pf",
                require('telescope.builtin').find_files,
                desc = "Find file in directory"
            },
            {
                "<C-p>",
                require('telescope.builtin').git_files,
                desc = "Find file in git"
            },
        }
    }
}
