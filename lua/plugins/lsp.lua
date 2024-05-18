return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          { "j-hui/fidget.nvim", opts = {} },
          { "folke/neodev.nvim", opts = {} },

        },
        config = function()
            require("mason").setup()
            local mason_lsp = require("mason-lspconfig")
            require("lspconfig")


            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

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

            local servers = {
                -- Add config if needed
            }

            mason_lsp.setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        settings = servers[server_name],
                    }
                end,
            }

        end
    }
}
