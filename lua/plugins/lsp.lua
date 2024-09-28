return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "mypy",
                "pyright",
                "lua-language-server",
                "bash-language-server",
                "dockerfile-language-server",
                "docker-compose-language-service",
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          { "j-hui/fidget.nvim", opts = {} },
          { "folke/neodev.nvim", opts = {} },

        },
        lazy = false,
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup {
                ensure_installed = { "pyright" },
            }

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            lspconfig.elixirls.setup({
                cmd = { "elixir-ls" },
                capabilities = capabilities
            })

            lspconfig.bashls.setup({
                capabilities = capabilities
            })
            lspconfig.jdtls.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities
            })
            lspconfig.docker_compose_language_service.setup({
                capabilities = capabilities
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
                    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

                    vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
                    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
                end,
            })

        end
    },
    {
        "mfussenegger/nvim-lint",
        config = function ()
            local lint = require('lint')
            lint.linters_by_ft = {
                python = { "mypy" }
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    lint.try_lint()
                end
            })
        end

    }
}
