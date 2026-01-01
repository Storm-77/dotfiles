local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        astro = { { "prettierd", "prettier" } },
        c = { "clangformat" },
        cpp = { "clangformat" },
        objc = { "clangformat" },
        objcpp = { "clangformat" },
        cuda = { "clang_format" },
        proto = { "clang_format" },
        sql = { "pg_format" },
        html = {
            formatters = { "prettier", "prettierd" },
            stop_after_first = true
        },
    },
    formatters = {
        pg_format = {
            command = "pg_format",
            args = {
                "--spaces", "4",
                "-t"
            },
            stdin = true,
        },
        -- clangformat = {
        --
        --   prepend_args = { "-style=Microsoft" },
        -- },
        --
    },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
    conform.format({
        lsp_fallback = true,
        async = true
    })
end)

vim.lsp.config('clangd', {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        clangd = {
            formatStyle = "Microsoft",
        },
    },
});
vim.lsp.enable('clangd');
