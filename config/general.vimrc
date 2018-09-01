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
colorscheme dracula

if exists('&guifont')
    set guifont=Source\ Code\ Pro
endif

" }}}

" Completion {{{
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Cut down on noise from completions
set shortmess+=c
" }}}
"
" Formatting {{{
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
" }}}

" Local Settings {{{
set exrc
set secure
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

" NrrwRegion {{{
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
"}}}

" Search Settings {{{
set nohlsearch
" }}}

" Preview substitute {{{
 set inccommand=split
" }}}

" Move backup files to central directory
set backupdir-=.

" Persistent undo
set undofile

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

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
" }}}

" VCS {{{
    let g:signify_vcs_list = [ 'git' ]
    let g:signify_realtime = 1
" }}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e

call LoadRC('denite')
