" vim: foldmethod=marker
" General Keymaps {{{
cnoremap <C-g> <esc>
" }}}

" vim-leader-guide {{{
nnoremap <localleader> :<c-u>LeaderGuide  ','<CR>
vnoremap <localleader> :<c-u>LeaderGuideVisual  ','<CR>
" }}}

" Vimdoc {{{
augroup vimfiles
    autocmd!
    autocmd FileType vim nmap <buffer> K :execute ':help' expand('<cword>')<CR>
augroup END
" }}}

" Load space mnemonics
call LoadRC('space')
