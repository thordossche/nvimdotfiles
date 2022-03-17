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
