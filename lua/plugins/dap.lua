return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "williamboman/mason.nvim",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Setup DAP UI
            dapui.setup()

            -- Setup DAP virtual text
            require("nvim-dap-virtual-text").setup()

            -- Setup Python DAP
            require("dap-python").setup("python") -- Or use an absolute path to the python executable

            -- Custom Python configuration (optional)
            table.insert(dap.configurations.python, {
                type = 'python',
                request = 'launch',
                name = 'Launch current file',
                program = '${file}',
                console = 'integratedTerminal',
                pythonPath = function()
                    -- Change this to the path of your Python interpreter with debugpy installed
                    return 'python' -- Replace with full path if necessary
                end,
            })

            -- Key mappings for DAP
            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                dapui.eval(nil, { enter = true })
            end)

            -- DAP control key mappings
            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F10>", dap.restart)

            -- Automatically open UI when debugging starts
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            -- Automatically close UI when debugging stops
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}

