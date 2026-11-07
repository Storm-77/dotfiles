require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
});

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "clangd", "emmet_ls" }
});

vim.diagnostic.config({
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 2 },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)
    vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "R", vim.lsp.buf.rename, opts)
end

local cust_mapping = {
    ["emmet_ls"] = {
        on_attach = on_attach,
        filetypes = { "html", "css", "php" },
    }
    ,

    ["intelephense"] = {
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
}

local servers = require("mason-lspconfig").get_available_servers()
for _, server in ipairs(servers) do
    vim.lsp.config(server, { on_attach = on_attach, capabilities = capabilities })
end

for serv_name, serv_config in pairs(cust_mapping) do
    vim.lsp.config(serv_name, vim.tbl_deep_extend("force", { capabilities = capabilities }, serv_config))
end

vim.lsp.config("roslyn_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "cs" },
    cmd = {
        "Microsoft.CodeAnalysis.LanguageServer",
        "--logLevel",
        "Information",
        "--extensionLogDirectory",
        vim.fs.dirname(vim.lsp.log.get_filename()),
        "--stdio",
    },
})
vim.lsp.enable("roslyn_ls")
