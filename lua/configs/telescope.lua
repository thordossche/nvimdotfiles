require('telescope').setup {
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('coc')

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending layout.prompt_position=top<cr>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find({sorting_strategy=ascending})<cr>', { noremap = true })


