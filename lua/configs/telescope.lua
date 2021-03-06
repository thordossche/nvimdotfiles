require('neoclip').setup({})
require('telescope').setup({})

require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', { noremap = true })
vim.api.nvim_set_keymap(
  'n',
  '<leader>fh',
  '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find({sorting_strategy=ascending})<cr>',
  { noremap = true }
)
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>Telescope neoclip<cr>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>z', ':lua require"telescope.builtin".find_files({cwd = "~/.config/nvim/lua/configs"}) <CR>', {})
