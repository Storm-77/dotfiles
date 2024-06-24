require("mason").setup();

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver", "clangd", "volar", "emmet_ls" }
});

local on_attach = function()
    vim.keymap.set("n", "<leader>rn", "vim.lsp.buf.rename", {})
    vim.keymap.set("n", "<leader>ca", "vim.lsp.buf.code_action", {})


    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gf", require("telescope.builtin").lsp_references, {})
    vim.keymap.set("n", "K", vim.lsp.buf.definition, {})
end

require("mason-lspconfig").setup_handlers {

    function(server_name) -- handler for every server
        require("lspconfig")[server_name].setup {
            on_attach = on_attach
        }
    end,

    ["emmet_ls"] = function()
        require("lspconfig").emmet_ls.setup {
            on_attach = on_attach,
            filetypes = { "html", "css", "php" },
        }
    end,

    ["intelephense"] = function()
        require("lspconfig").intelephense.setup {
            on_attach = on_attach,
            settings = {
                intelephense = {
                    stubs = {
                        'wordpress',
                    },
                    environment = {
                        includePaths = '$HOME/.config/composer/vendor/php-stubs/'
                    }
                }
            }
        }
    end
}
