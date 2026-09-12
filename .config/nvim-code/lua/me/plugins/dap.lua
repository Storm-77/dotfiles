return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "rcarriga/nvim-dap-ui",
            "jay-babu/mason-nvim-dap.nvim", -- Auto-installs debug adapters via Mason
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            local keymap_setup = require("me.debug-options")
            -- Basic DAP setup
            dapui.setup()

            -- DAP UI on/off
            dap.listeners.after.event_initialized["dapui_config"] = function()
                keymap_setup.debug_keymaps_set()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
                keymap_setup.debug_keymaps_unset()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
                keymap_setup.debug_keymaps_unset()
            end


            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            -- dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            -- dap.listeners.before.event_exited.dapui_config = function() dapui.close() end


            -- Virtual text
            require("nvim-dap-virtual-text").setup()

            -- Mason DAP setup (installs adapters like debugpy, delve, etc.)
            require("mason-nvim-dap").setup({
                ensure_installed = { "python" }, -- Add languages you need
                automatic_installation = true,
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                    python = function(config)
                        config.adapters = {
                            type = "executable",
                            command = "python",
                            args = { "-m", "debugpy.adapter" },
                        }
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            })

            vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>c", require("dap").continue, { desc = "Continue" })
            vim.keymap.set("n", "<leader>i", require("dap").step_into, { desc = "Step Into" })
            vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "Continue" })

            vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
        end,
    },
}
