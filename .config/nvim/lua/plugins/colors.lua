return {
    {
        "BigSpaceships/ccc.nvim",
        lazy = false,
        config = function()
            local ccc = require("ccc")

            local opts = {
                auto_enable = true,
                lsp = true,
                recognize = {
                    -- input = true,
                    -- output = true,
                },
                outputs = {
                    ccc.output.hex,
                    ccc.output.css_rgb,
                    ccc.output.css_rgb_commas,
                    ccc.output.css_hsl,
                }
            }

            ccc.setup(opts)
        end,
        keys = {
            {
                "<leader>pc",
                "<Cmd>CccPick<Cr>"
            }
        },
    },
}
