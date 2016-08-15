" vim: foldmethod=marker
" General Keymaps {{{
"Insert date
function! Today()
    execute "normal! \"=strftime('%Y-%m-%d')\<cr>p"
endfunction
command! Today call Today()

cnoremap <C-g> <esc>

if maparg('<leader>:', 'n') != ""
    nunmap <leader>:
end
nnoremap <Plug>(M-x) :call SpacevimCommands()<CR>
nmap <leader><leader> <Plug>(M-x)

" }}}
"
" Window Management {{{
if maparg('<leader>wc', 'n') != ""
    nunmap <leader>wc
end
nnoremap <Plug>(delete-window) :q<cr>
nmap <Leader>wd <Plug>(delete-window)
" }}}

" {{{ FZF
nnoremap <Plug>(fzf-lines) :BLines<CR>
nmap <Leader>ss <Plug>(fzf-lines)

nnoremap <Plug>(fzf-tags) :BTags<CR>
nmap <Leader>sj <Plug>(fzf-tags)
" }}}

" vim-leader-guide {{{
nnoremap <localleader> :<c-u>LeaderGuide  ','<CR>
vnoremap <localleader> :<c-u>LeaderGuideVisual  ','<CR>
" " This variant won't habe any group names.

" " Group names can be defined by filetype. Add the following lines:
" let g:llmap = {}
" autocmd FileType tex let g:llmap.l = { 'name' : 'vimtex' }
" call leaderGuide#register_prefix_descriptions(",", "g:llmap")
" " to name the <localleader>-n group vimtex in tex files.
" }}}

