" remap escape
imap jk <Esc>

" general settings
let mapleader=' '
set number relativenumber
set scrolloff=10
set expandtab
set mouse=a

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

" tabs
autocmd Filetype vue setlocal ts=2 sw=2 sts=0 noexpandtab


function! DisableST()
  return " "
endfunction
au BufEnter NvimTree setlocal statusline=%!DisableST()
