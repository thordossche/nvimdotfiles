local set = vim.keymap.set

-- Remap <escape>
set('i', 'kj', '<c-c>')

-- Moving in between splits
set('n', '<c-h>', '<c-w><c-h>')
set('n', '<c-j>', '<c-w><c-j>')
set('n', '<c-k>', '<c-w><c-k>')
set('n', '<c-l>', '<c-w><c-l>')

-- Copying to clipboard
set('v', '<leader>y', '"+y')
set('n', '<leader>y', '"+y')

-- Pasting from clipboard
set('v', '<leader>p', '"+P')
set('n', '<leader>p', '"+P')

-- Clear the highlights
set('n', '<c-s>', '<cmd>:nohlsearch<CR>:diffupdate<CR>:normal! <C-L><CR><CR>')

-- Source the current file
set('n', '<leader><leader>x', '<cmd>source %<CR>')
