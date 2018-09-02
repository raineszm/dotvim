" vim: foldmethod=marker
" Load the vim scripts in the bundle directory
let mapleader="\<Space>"
let maplocalleader=','

if isdirectory(expand('$HOME/anaconda3/'))
    let g:python3_host_prog = expand('$HOME/anaconda3/bin/python')
endif

if has('macunix')
    let g:python_host_prog = '/System/Library/Frameworks/Python.framework/Versions/Current/bin/python'
endif


let g:config_dir = fnamemodify(expand('<sfile>'), ':p:h')

function! LoadRC(name)
    let l:name = '/config/' . a:name . '.vimrc'
    execute 'source' g:config_dir . l:name
endfunction

let g:rcs = [
            \ 'dein',
            \ 'options',
            \ 'gui',
            \ 'mappings',
            \ 'lang',
            \ 'plugins'
            \ ]

for rc in g:rcs
    call LoadRC(rc)
endfor


