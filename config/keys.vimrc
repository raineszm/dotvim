" vim: foldmethod=marker
" General Keymaps {{{
"Insert date
function! Today()
    execute "normal! \"=strftime('%Y-%m-%d')\<cr>p"
endfunction
command! Today call Today()

cnoremap <C-g> <esc>

" }}}

" vim-leader-guide {{{
nnoremap <localleader> :<c-u>LeaderGuide  ','<CR>
vnoremap <localleader> :<c-u>LeaderGuideVisual  ','<CR>
" }}}

" Load space mnemonics
call LoadRC('space')
