-- quickfixlist
vim.api.nvim_set_keymap("n", "<leader>lo", ":copen<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>lc", ":cclose<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ln", ":cnext<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>lp", ":cprev<cr>", {})
-- source config
vim.api.nvim_set_keymap("n", "<leader>s", ":source ~/.config/nvim/init.lua<cr>", {})

-- vim-fugative
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", {})

-- lualine
require('lualine').setup({
  options = {
    disabled_filetypes = {
      "NvimTree"
    },
  },
})

-- gitsigns
require('gitsigns').setup()
