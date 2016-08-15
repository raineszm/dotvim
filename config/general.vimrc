" vim: foldmethod=marker
" Basic Settings {{{
"Get some nice syntax highlighting and language features
" syntax on
" filetype plugin indent on
" Commented stuff already set by sensible

"Set the default indent
set shiftwidth=4
set softtabstop=4
set expandtab

"Basic setting changes
" set incsearch
" set ruler
" set showcmd
set mouse=a

"Set buffers to be hidden instead of closed when switched
set hidden

"Turn on modeline
set modeline

"Set grep command
set grepprg=grep\ -nH\ $*

" Setup the wildmenu {{{
set wildmode=longest:full
" set wildmenu
" }}}
" }}}

" Visual Settings {{{

"Airline
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1

"Color schemes
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme solarized

set guifont=Source\ Code\ Pro

" }}}

" Completion {{{
let g:deoplete#enable_at_startup = 1
" }}}
"
" Runtime Plugins"{{{
runtime! ftplugin/man.vim
"}}}
"
" External tools {{{
if executable('ag')
    set grepprg=ag\ --nocolor\ --nogroup
endif

" }}}
"
" Remote editing {{{
function! RemoteConfiguration()
    inoremap jk <esc>
    vnoremap jk <esc>
    colorscheme default
    return
endfunction

command! SSHConfig call RemoteConfiguration()
" }}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e

