return {
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
            local mason_lsp = require("mason-lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            -- lspconfig.pyright.setup({
            --     capabilities = capabilities
            -- })
            lspconfig.pyright.setup({
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
    }
}
