" vim: foldmethod=marker
" Load the vim scripts in the bundle directory
let mapleader="\<Space>"
let maplocalleader=','

let g:config_dir = fnamemodify(expand('<sfile>'), ':p:h')

function! LoadRC(name)
    let l:name = '/config/' . a:name . '.vimrc'
    execute 'source' g:config_dir . l:name
endfunction

let g:rcs = [
            \ 'init',
            \ 'general',
            \ 'keys',
            \ 'lang'
            \ ]

for rc in g:rcs
    call LoadRC(rc)
endfor


