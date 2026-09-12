require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
});

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "clangd", "emmet_ls" }
});

local on_attach = function()
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})


    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
    vim.keymap.set("n", "K", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "R", vim.lsp.buf.rename, {})
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
    vim.lsp.config(server, { on_attach = on_attach })
end

for serv_name, serv_config in pairs(cust_mapping) do
    vim.lsp.config(serv_name, serv_config)
end

local roslyn_libexec = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages", "roslyn", "libexec")
vim.lsp.config("roslyn", {
    on_attach = on_attach,
    filetypes = { "razor" },
    cmd = {
        vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", "roslyn"),
        "--logLevel",
        "Information",
        "--extensionLogDirectory",
        vim.fs.dirname(vim.lsp.log.get_filename()),
        "--stdio",
        "--extension",
        vim.fs.joinpath(roslyn_libexec, "Microsoft.VisualStudioCode.RazorExtension.dll"),
    },
})

vim.lsp.config("roslyn_ls", {
    on_attach = on_attach,
    cmd = {
        vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", "roslyn-language-server"),
        "--logLevel",
        "Information",
        "--extensionLogDirectory",
        vim.fs.dirname(vim.lsp.log.get_filename()),
        "--stdio",
    },
    filetypes = { "cs" },
})
vim.lsp.enable("roslyn_ls")
