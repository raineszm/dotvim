" vim: foldmethod=marker
" General Keymaps {{{
"Insert date
function! Today()
    execute "normal! \"=strftime('%Y-%m-%d')\<cr>p"
endfunction
command! Today call Today()

cnoremap <C-g> <esc>

nnoremap <Plug>(M-x) :call SpacevimCommands()<CR>
nmap <leader><leader> <Plug>(M-x)

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

" Error checking {{{
nnoremap <SPACE>el :lopen<cr>
nnoremap <SPACE>en :lnext<cr>
nnoremap <SPACE>ep :lprevious<cr>
nnoremap <SPACE>eN :lprevious<cr>
" }}}

" Navigation {{{
" Easymotion {{{
nmap <Leader>jj <Plug>(easymotion-s)
nmap <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jl <Plug>(easymotion-bd-jk)
" }}}

" }}}
