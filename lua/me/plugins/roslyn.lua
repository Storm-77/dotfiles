return {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {
        broad_search = true, -- scans parent/child dirs for .sln files
        -- lock_target = true,  -- sticks to detected solution after first attach
        --  capabilities = vim.lsp.protocol.make_client_capabilities(),
        init_options = {
            uselspprogress = true,
        },
    },
}
