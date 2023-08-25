require('neoclip').setup({})
require('telescope').setup({})

require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')

local builtin = require('telescope.builtin')


vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap(
  'n',
  '<leader>th',
  '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find({sorting_strategy=ascending})<cr>',
  { noremap = true }
)
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>Telescope neoclip<cr>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>z', ':lua require"telescope.builtin".find_files({cwd = "~/.config/nvim/lua/configs"}) <CR>', {})

vim.keymap.set('n', '<leader>h', builtin.lsp_document_symbols, {})

