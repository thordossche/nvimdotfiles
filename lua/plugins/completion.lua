return {
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        priority = 100,
        dependencies = {
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            vim.opt.shortmess:append "c"

            local lspkind = require('lspkind')
            lspkind.init({})


            local cmp = require("cmp")

            cmp.setup {
                sources = {
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-y>"] = cmp.mapping(
                        cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true,
                        },
                        { "i", "c" }
                    ),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = lspkind.cmp_format {
                        with_text = true,
                        menu = {
                            buffer = "[buf]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[api]",
                            path = "[path]",
                            null_ls = "[linter]",
                            luasnip = "[snip]",
                        },
                    },
                }
            }

            -- Add brackets for function completion
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
              'confirm_done',
              cmp_autopairs.on_confirm_done()
            )

            -- Setup up vim-dadbod
            cmp.setup.filetype({ "mysql" }, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" },
                },
            })

            -- seach autocompletion 
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- cmdline autocompletion
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources({
                        { name = "path" },
                    }, {
                    {
                    name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        },
                    },
                }),
            })

            -- Setup luasnip
            local ls = require "luasnip"
            ls.config.set_config {
                history = false,
                updateevents = "TextChanged,TextChangedI",
            }

            -- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
            --     loadfile(ft_path)()
            -- end

            vim.keymap.set({ "i", "s" }, "<c-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<c-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })

        end,
    },
}
