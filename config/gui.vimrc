"Settings



" color schemes
if empty($SSH_TTY) && empty($SSH_SHELL)
    if exists('&termguicolors')
        set termguicolors
    else
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
endif
colorscheme dracula

" font
if exists('&guifont')
    set guifont=Source\ Code\ Pro
endif


" Status line {{{
let g:lightline = {
    \ 'colorscheme': 'Dracula'
\}

" Add linting to status line
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'asyncrun_status': 'lightline#asyncrun#status',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline.active = { 'right': [['asyncrun_status'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
" }}}

