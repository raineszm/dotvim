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

" Setup the wildmenu {{{
set wildmode=longest:full
" }}}
" }}}

" Visual Settings {{{

"Airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" color schemes
if empty($SSH_TTY) && empty($SSH_SHELL)
    if exists('&termguicolors')
        set termguicolors
    else
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
endif
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
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ag')
    set grepprg=ag\ --nocolor\ --nogroup
endif

" Workaround to avoid vim-fugitive dying
set shell=/bin/bash

" Dash/Zeavim {{{
let g:zv_disable_mapping = 1
" }}}

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

let g:startify_bookmarks = [
            \ {'vi': '~/.config/nvim/config/init.vimrc'},
            \ {'vg': '~/.config/nvim/config/general.vimrc'},
            \ {'vk': '~/.config/nvim/config/keys.vimrc'},
            \ {'vl': '~/.config/nvim/config/lang.vimrc'}
            \ ]

" }}}

" Search Settings {{{
"
" incsearch {{{

set hlsearch
let g:incsearch#auto_nohlsearch = 1
" }}}

" Easymotion {{{
let g:EasyMotion_do_mapping = 0
" }}}

" Preview substitue {{
 set inccommand=split
" }}}

" Hacks and Fixes {{{

" Make sure leaderguide uses the prefixes from spacevim
let g:lmap = {}
call leaderGuide#register_prefix_descriptions(' ', 'g:lmap')

" }}

" }}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e
