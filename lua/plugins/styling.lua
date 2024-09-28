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
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('bufferline').setup {
                options = {
                    mode = "buffers",
                    numbers = "none",
                    close_command = "write | bd! %d",
                    right_mouse_command = "write | bd! %d",
                    left_mouse_command = "buffer %d",
                    max_name_length = 18,
                    max_prefix_length = 15,
                    tab_size = 18,
                    diagnostics = false,
                    diagnostics_update_in_insert = false,
                    buffer_close_icon= "",
                    show_buffer_icons = true,
                    show_tab_indicators = true,
                },
                highlights = {
                    indicator_selected = {
                        guifg = "NONE",
                        guibg = "NONE",
                    },
                }
            }
            vim.keymap.set('n', 'H', ':BufferLineCyclePrev<CR>', {silent = true})
            vim.keymap.set('n', 'L', ':BufferLineCycleNext<CR>', {silent = true})
            vim.keymap.set('n', 'Q', ':write | :bd<CR>', {silent = true})

        end
    }



}
