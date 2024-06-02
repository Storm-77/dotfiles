local builtin = require('telescope.builtin')

local ignore_patterns = { '.git', 'node_modules' };

vim.keymap.set('n', '<leader>pd', function()

    require('telescope.builtin').find_files({
        hidden = true,
        find_command = { 'rg', '--files', '--no-ignore' },
    })

end, { silent = true })

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>pa', function()

    require('telescope.builtin').find_files({
        hidden = true,
        file_ignore_patterns = ignore_patterns
    })

end, { silent = true })

vim.keymap.set('n', '<leader>pS', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

local harpoon = require("telescope").load_extension("harpoon")

vim.keymap.set('n', '<leader>pe', harpoon.marks, {})
