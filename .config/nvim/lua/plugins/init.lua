return {
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    {
        "theprimeagen/harpoon",
        keys = {
            {
                "<C-e>",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                "Toggle harpoon quick menu"
            },
            {
                "<leader>a",
                function()
                    require("harpoon.mark").add_file()
                end,
                "Add harpoon mark"
            },
            {
                "<leader>1",
                function()
                    require("harpoon.ui").nav_file(1)
                end,
                "Open harpoon mark 1"
            },
            {
                "<leader>2",
                function()
                    require("harpoon.ui").nav_file(2)
                end,
                "Open harpoon mark 2"
            },
            {
                "<leader>3",
                function()
                    require("harpoon.ui").nav_file(3)
                end,
                "Open harpoon mark 3"
            },
            {
                "<leader>4",
                function()
                    require("harpoon.ui").nav_file(4)
                end,
                desc = "Open harpoon mark 4"
            },
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight"
        },
    },
}
