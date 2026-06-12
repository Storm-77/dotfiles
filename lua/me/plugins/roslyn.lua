return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
        broad_search = true, -- Scans parent/child dirs for .sln files
        -- lock_target = true,  -- Sticks to detected solution after first attach
        --  capabilities = vim.lsp.protocol.make_client_capabilities(),
        init_options = {
            useLspProgress = true,
        },
    },
}
