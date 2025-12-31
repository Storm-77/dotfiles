vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("dbitt/yank_highlight", { clear = true }),
    desc = "Highlight on yank",
    callback = function()
        vim.hl.on_yank({ timeout = 500, higroup = "Visual" })
    end,
})
