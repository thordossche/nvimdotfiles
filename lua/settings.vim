" remap escape
imap jk <Esc>

" general settings
let mapleader=' '
set number relativenumber
set scrolloff=10
set expandtab

" search settings
set ignorecase
set smartcase
nnoremap <leader><CR> :nohlsearch<CR>

" split current file
nnoremap <leader>/h :split<Enter>
nnoremap <leader>/v :vsplit<Enter>
" tab open settings
set splitbelow
set splitright

" better navigation between tabs
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+P
vnoremap <leader>p "+P

" Remap pageUp and pageDown
map <PageUp> <C-u>
map <PageDown> <C-d>


lua << EOF
vim.api.nvim_set_keymap("n", "<leader>a", ':%y<cr>', { noremap = false, silent = true })
EOF
