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
nmap <Leader>ss <Plug>(fzf-swoop)

nnoremap <Plug>(fzf-tags) :BTags<CR>
nmap <Leader>sj <Plug>(fzf-tags)
" }}}

