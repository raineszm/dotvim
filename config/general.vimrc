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
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Color schemes
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme solarized8_dark

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

" Startify {{{
let g:startify_custom_header = readfile(expand('<sfile>:p:h').'/banner.txt')

highlight link StartifyHeader IncSearch
" }}}

" Search Settings
" Over.vim {{{
    let g:over#command_line#search#enable_move_cursor = 1
" }}}
"
" incsearch {{{

set hlsearch
let g:incsearch#auto_nohlsearch = 1
" }}}

" }}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e

