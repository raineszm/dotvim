" vim: foldmethod=marker
" General Keymaps {{{
cnoremap <C-g> <esc>
" }}}

" vim-leader-guide {{{
nnoremap <localleader> :<c-u>LeaderGuide  ','<CR>
vnoremap <localleader> :<c-u>LeaderGuideVisual  ','<CR>
" }}}

" Load space mnemonics
call LoadRC('space')
