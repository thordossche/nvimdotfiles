lua << EOF
require('telescope').setup {
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('coc')
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>fh <cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending layout.prompt_position=top<cr>

nnoremap <leader>fh <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy=ascending})<cr>


