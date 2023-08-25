" for magma
" remap escape
inoremap <Esc> ''
imap kj <C-c>

" general settings
let mapleader=' '
set number relativenumber
set scrolloff=10
set expandtab
set mouse=a
set laststatus=3

" get paste
nnoremap gp `[v`]

" search settings
set ignorecase
set smartcase

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

nnoremap <silent><expr> <leader>r  :MagmaEvaluateOperator<CR>
" nnoremap <silent>       <leader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <leader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <leader>rr :MagmaReevaluateCell<CR>
nnoremap <silent>       <leader>rd :MagmaDelete<CR>
nnoremap <silent>       <leader>ro :MagmaShowOutput<CR>

let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"

" :CloseAllFloatingWindows
" Closes all floating windows, useful for cleaning up messed up pop-ups
if has('nvim-0.4.0')
  command! CloseAllFloatingWindows   lua _G.CloseAllFloatingWindows()
lua<<EOF
  _G.CloseAllFloatingWindows = function()
    local closed_windows = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= "" then  -- is_floating_window?
        vim.api.nvim_win_close(win, false)  -- do not force
        table.insert(closed_windows, win)
      end
    end
    print(string.format('Closed %d windows: %s', #closed_windows, vim.inspect(closed_windows)))
  end
EOF
endif
