-- Disable default tmux navigator mappings
vim.g.tmux_navigator_no_mappings = 1

-- Key mappings for tmux navigation
local keymap_options = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<c-h>', ':TmuxNavigateLeft<cr>', keymap_options)
vim.api.nvim_set_keymap('n', '<c-j>', ':TmuxNavigateDown<cr>', keymap_options)
vim.api.nvim_set_keymap('n', '<c-k>', ':TmuxNavigateUp<cr>', keymap_options)
vim.api.nvim_set_keymap('n', '<c-l>', ':TmuxNavigateRight<cr>', keymap_options)

