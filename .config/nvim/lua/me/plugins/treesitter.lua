return {
    'nvim-treesitter/nvim-treesitter',

    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
        local treesitter = require('nvim-treesitter.configs');
        treesitter.setup({
            ensure_installed = { "typescript", "javascript", "bash", "c", "lua", "vim", "vimdoc", "dockerfile" },

            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,

                disable = {},
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-n>",
                    node_incremental = "<C-n>",
                    scope_incremental = false,
                    node_decremental = "<C-p>",
                },
            }
        })
    end

}
