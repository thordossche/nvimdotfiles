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
            local dap = require "dap"
            local ui = require "dapui"

            require("dapui").setup()

            require("nvim-dap-virtual-text").setup()

            require('dap-python').setup('python')
            table.insert(require('dap').configurations.python, {
              type = 'python',
              request = 'launch',
              name = 'My custom launch configuration',
              program = '${file}',
              -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
            })

            -- dap.adapters.python = {
            --   type = 'executable';
            --   command = 'python';
            --   args = { '-m', 'debugpy.adapter' };
            -- }
            --
            -- dap.configurations.python = {
            --   {
            --     type = 'python';
            --     request = 'launch';
            --     name = "Launch file";
            --     program = "${file}";
            --     pythonPath = function()
            --       return 'python'
            --     end;
            --   },
            -- }

              -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings

            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F10>", dap.restart)

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}
