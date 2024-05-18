return {
    {
        'olimorris/onedarkpro.nvim',
        priority = 1000,
        lazy = false,
        config = function()
            require("onedarkpro").setup({
                colors = {
                    yellow = "#ffaf5f",
                    red = "#E06C75",
                    gray = "#7D828D",
                },
                highlights = {
                    CursorLineNr = { fg = "${yellow}", bg = "NONE" },
                    TabLineSel = { bg = "NONE", fg = "${yellow}" },

                    NvimTreeFolderIcon = { fg = "${yellow}" },
                    NvimTreeNormalNC = { bg = "NONE" },
                    NvimTreeRootFolder = { fg = "${yellow}" },
                    ["@variable.python"] = { fg = "NONE" },
                    ["@field.python"] = { fg = "${red}" },
                },
                options = {
                    cursorline = true,
                    transparency = true,
                },
            })

            vim.cmd("colorscheme onedark")
            vim.api.nvim_set_option('cursorlineopt', 'number')
        end
    },
    {
        'kyazdani42/nvim-web-devicons'
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {},
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                component_separators = { left = '', right = ''},
            },
            sections = {
                lualine_c = {'%=', 'filename'},
                lualine_x = {'filetype'},
            },
        }
    }


}
