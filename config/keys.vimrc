" vim: foldmethod=marker
" General Keymaps {{{
cnoremap <C-g> <esc>
" }}}

" vim-leader-guide {{{
nnoremap <localleader> :<c-u>LeaderGuide  ','<CR>
vnoremap <localleader> :<c-u>LeaderGuideVisual  ','<CR>
map <localleader>. <Plug>leaderguide-buffer
let g:llmap = {}
call leaderGuide#register_prefix_descriptions(",", "g:llmap")
" }}}

" Vimdoc {{{
augroup vimfiles
    autocmd!
    autocmd FileType vim nmap <buffer> K :execute ':help' expand('<cword>')<CR>
augroup END
" }}}

" Language Server {{{
nnoremap gh :<c-u>LspHover<CR>
" }}}

" Load space mnemonics
call LoadRC('space')
