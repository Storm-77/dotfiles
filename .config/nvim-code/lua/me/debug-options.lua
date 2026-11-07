return {
    debug_keymaps_set = function()
        local dap = require("dap")
        local opts = { noremap = true, silent = true }

        -- Step debugging (F-keys work great here)
        vim.keymap.set('n', '<F10>', dap.step_over, opts)
        vim.keymap.set('n', '<F11>', dap.step_into, opts)
        vim.keymap.set('n', '<F12>', dap.step_out, opts)

        -- Single-key debug commands (super fast during debugging)
        vim.keymap.set('n', 's', dap.step_over, opts) -- s = step over
        vim.keymap.set('n', 'i', dap.step_into, opts) -- i = into
        vim.keymap.set('n', 'o', dap.step_out, opts)  -- o = out
        vim.keymap.set('n', 'c', dap.continue, opts)  -- c = continue
        vim.keymap.set('n', 'r', dap.repl.open, opts) -- r = repl

        print("🛠️ Debug mode active - s/i/o/c/r keys enabled")
    end,

    debug_keymaps_unset = function()
        vim.keymap.del('n', 's')
        vim.keymap.del('n', 'i')
        vim.keymap.del('n', 'o')
        vim.keymap.del('n', 'c')
        vim.keymap.del('n', 'r')

        print("Debug session ended")
    end
}
