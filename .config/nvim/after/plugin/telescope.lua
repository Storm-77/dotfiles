local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pd', function()
    require('telescope.builtin').find_files({
        hidden = true
    })
end, { silent = true })

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pa', builtin.find_files, {})

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

local harpoon = require("telescope").load_extension("harpoon")

vim.keymap.set('n', '<leader>pe', harpoon.marks, {})
