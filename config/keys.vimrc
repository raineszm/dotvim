" vim: foldmethod=marker
" General Keymaps {{{
"Insert date
function! Today()
    execute "normal! \"=strftime('%Y-%m-%d')\<cr>p"
endfunction
command! Today call Today()

cnoremap <C-g> <esc>

" }}}
"
" Window Management {{{
nnoremap <Plug>(delete-window) :q<cr>
nmap <Leader>wd <Plug>(delete-window)
" }}}

" {{{ Unite
nnoremap <Plug>(search-tags) :Denite outline<CR>
nmap <Leader>sj <Plug>(search-tags)
" }}}

" Startify {{{
nnoremap <Leader>bh :Startify<cr>
" }}}

" vim-leader-guide {{{
nnoremap <localleader> :<c-u>LeaderGuide  ','<CR>
vnoremap <localleader> :<c-u>LeaderGuideVisual  ','<CR>
" }}}


" Navigation {{{
" Easymotion {{{
nmap <Leader>jj <Plug>(easymotion-s)
nmap <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jl <Plug>(easymotion-bd-jk)
" }}}

" }}}
"
call LoadRC('space')
