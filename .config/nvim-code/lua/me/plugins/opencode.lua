return {
    "nickjvandyke/opencode.nvim",
    keys = {
        {
            "<leader>a",
            function()
                require("opencode").ask("@this: ")
            end,
            mode = "x",
            desc = "Ask OpenCode about selection",
        },
        {
            "<leader>k",
            function()
                require("opencode").select()
            end,
            mode = { "n", "x" },
            desc = "Open OpenCode action/prompt picker",
        },
    },
}
