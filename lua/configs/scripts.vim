" Copy file contents to clipboard
nnoremap <leader>z :silent !cat $(echo %:p) \| xclip -i -selection clipboard <Enter>

" Latex
autocmd BufWritePost *.tex silent! execute "!pdflatex $(echo %:p) >/dev/null 2>&1 && atril $(echo %:p | sed 's/\.tex/.pdf/') >/dev/null 2>&1 &"
