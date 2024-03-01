require("mason").setup();

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver", "clangd", "volar" }
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
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    --["rust_analyzer"] = function ()
    --    require("rust-tools").setup {}
    -- end
}
