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
    }
}
