local builtin = require('telescope.builtin');
local telescope = require("telescope");

local ignore_patterns = { '.git/', 'node_modules' };

vim.keymap.set('n', '<leader>pd', function()
    builtin.find_files({
        hidden = true,
        find_command = { 'rg', '--files', '--no-ignore' },
    })
end, { silent = true })

local find_all_with_ignores = function()
    builtin.find_files({
        hidden = true,
        file_ignore_patterns = ignore_patterns,
    })
end

local find_symbols = function()
    builtin.treesitter()
end

vim.keymap.set('n', '<leader>l', find_symbols, { noremap = true })

vim.keymap.set('n', '<C-p>', function()
    xpcall(builtin.git_files, find_all_with_ignores)
end, {})

vim.keymap.set('n', '<leader>pa', find_all_with_ignores, { silent = true })

vim.keymap.set('n', '<leader>pS', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

local actions = require("telescope.actions")
telescope.setup({
    defaults = {
        mappings = {
            i = { ["<esc>"] = actions.close },
        },
    },
})

local harpoon = telescope.load_extension("harpoon")

vim.keymap.set('n', '<leader>ph', harpoon.marks, {})

local worktree = telescope.load_extension("git_worktree")

vim.keymap.set('n', '<leader>pe', worktree.git_worktrees, {})
vim.keymap.set('n', '<leader>pn', worktree.create_git_worktree, {})

vim.keymap.set('n', '<C-[>', function()
    builtin.lsp_document_symbols()
end)
