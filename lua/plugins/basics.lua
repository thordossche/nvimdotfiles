return {
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {}
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {}
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        'stevearc/oil.nvim',
        config = function ()
            require("oil").setup({
                basic_file_explorer = true,
                columns = {'icon'}
            })
            vim.keymap.set("n", "<leader>n", require('oil').toggle_float, { desc = "Open parent directory" })
        end
    },
    {
        "ggandor/leap.nvim",
        config = function()
            local leap = require('leap')
            leap.add_default_mappings()
            leap.opts.case_sensitive = true
        end,
    },
    {
        'metakirby5/codi.vim'
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        config = function ()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)
        end
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function ()
            require("toggleterm").setup{
                size = 20,
                open_mapping = [[<c-\>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                direction = 'float',
                float_opts = {
                    border = 'curved',
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    }
                }
            }

            local Terminal  = require('toggleterm.terminal').Terminal
            local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, })

            function _lazygit_toggle()
                lazygit:toggle()
            end

            vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
        end

    }
}

