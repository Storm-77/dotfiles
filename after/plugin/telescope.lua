local builtin = require('telescope.builtin')

local ignore_patterns = { '.git/', 'node_modules' };

vim.keymap.set('n', '<leader>pd', function()
    require('telescope.builtin').find_files({
        hidden = true,
        find_command = { 'rg', '--files', '--no-ignore' },
    })
end, { silent = true })

local find_all_with_ignores = function()
    require('telescope.builtin').find_files({
        hidden = true,
        file_ignore_patterns = ignore_patterns
    })
end

vim.keymap.set('n', '<C-p>', function()
    xpcall(builtin.git_files, find_all_with_ignores)
end, {})

vim.keymap.set('n', '<leader>pa', find_all_with_ignores, { silent = true })

vim.keymap.set('n', '<leader>pS', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

local harpoon = require("telescope").load_extension("harpoon")

vim.keymap.set('n', '<leader>ph', harpoon.marks, {})

local worktree = require("telescope").load_extension("git_worktree")

vim.keymap.set('n', '<leader>pe', worktree.git_worktrees, {})
vim.keymap.set('n', '<leader>pn', worktree.create_git_worktree, {})
