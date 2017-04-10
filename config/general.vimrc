" vim: foldmethod=marker
" Basic Settings {{{

"Set the default indent
set shiftwidth=4
set softtabstop=4
set expandtab

"Basic setting changes
set mouse=a

"Turn on modeline
set modeline

" Setup the wildmenu {{{
set wildmode=longest:full
" }}}
" }}}

" Visual Settings {{{

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

" External tools {{{
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ag')
    set grepprg=ag\ --nocolor\ --nogroup
endif

" Workaround to avoid vim-fugitive dying
set shell=/bin/bash

" communicate with gpg using pipes
let g:GPGUsePipes=1

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
            \ {'vl': '~/.config/nvim/config/lang.vimrc'},
            \ {'vd': '~/.config/nvim/config/dein.toml'}
            \ ]

" }}}

" Search Settings {{{
set nohlsearch
" }}}

" Preview substitute {{{
 set inccommand=split
" }}}

" Move backup files to central directory
set backupdir-=.

" Disable mappings {{{
let g:gitgutter_map_keys = 0
let g:EasyMotion_do_mapping = 0
" }}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e

call LoadRC('denite')
