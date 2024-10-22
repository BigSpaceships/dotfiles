return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,

        keys = {
            {
                "<leader>pf",
                function()
                    local builtin = require('telescope.builtin')
                    builtin.find_files()
                end,
                desc = "Find file in directory"
            },
            {
                "<C-p>",
                function()
                    local builtin = require('telescope.builtin')
                    builtin.git_files()
                end,
                desc = "Find file in git"
            },
        }
    }
}
