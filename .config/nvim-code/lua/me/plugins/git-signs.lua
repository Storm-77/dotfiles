return {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
    },
    config = function()
        require('gitsigns').setup()

        vim.api.nvim_set_hl(0, "SignColumn", { bg = "#101018" })
        vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#3fb950" })
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#d29922" })
        vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f85149" })

        vim.keymap.set("n", "<C-s>", ":Gitsigns preview_hunk_inline<CR>")
        -- vim.keymap.set("n", "<leader>m", ":Gitsigns toggle_current_line_blame<CR>")

        vim.keymap.set("n", "<leader>m", function()
           require("gitsigns").blame_line({ full = false })
        end)


    end

}
