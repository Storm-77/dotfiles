vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pl", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set({"n","v"}, "<leader>p", [["+p]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_set_keymap('n', '<leader>q', ':b#<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<S-U>', '<Cmd>redo<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', '<Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

local add_to_git = function ()
    local relPath = vim.fn.expand('%:p')  -- Get the absolute path of the current file
    print(relPath);
    os.execute("git add " .. relPath)
    --print(vim.fn.expand('%'))
end

vim.keymap.set({"n"}, "<leader>g", add_to_git)

vim.keymap.set('n', '<leader>pv', function() local filename = vim.fn.input('New file name: '); if filename ~= '' then vim.cmd('edit ' .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':h') .. '/' .. filename) end end, { desc = "Create a new file in the same directory" })

vim.api.nvim_set_keymap('n', '<leader>x', ':!chmod a+x %<CR>', { noremap = true, silent = true })

