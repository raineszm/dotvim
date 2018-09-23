if !exists('g:ale_fixers')
    let g:ale_fixers = {}
endif

let g:ale_linters = {
            \ 'cpp': ['ccls'],
            \ 'python': ['pylint', 'black', 'isort']
            \ }

let g:ale_fixers.python = ['black', 'isort']
let g:ale_fixers.cpp = ['clangformat']

let g:ale_fix_on_save = 1
