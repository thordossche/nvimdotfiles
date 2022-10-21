-- quickfixlist
vim.api.nvim_set_keymap("n", "<leader>qo", ":copen<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>qc", ":cclose<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>qn", ":cnext<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>qp", ":cprev<cr>", {})
-- source config
vim.api.nvim_set_keymap("n", "<leader>s", ":source ~/.config/nvim/init.lua<cr>", {})

-- vim-fugative
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", {})

-- lualine
require('lualine').setup({
  options = {
    component_separators = { left = '', right = ''},
  },
  sections = {
    lualine_c = {'%=', 'filename'},
    lualine_x = {'filetype'},
  },
})

-- gitsigns
-- require('gitsigns').setup()
