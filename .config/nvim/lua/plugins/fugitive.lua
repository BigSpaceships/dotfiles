return {
    "tpope/vim-fugitive",
    keys = {
        {
            "<leader>gs",
            function()
                local paths = vim.fn.finddir(".git/..", vim.fn.expand('%:p:h') ..  ';')

                if paths ~= "" then
                    vim.cmd.Git()
                else
                    print("Not in a git repository")
                end

            end,
            desc = "open git view"
        },
    }
}
