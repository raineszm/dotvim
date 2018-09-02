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

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e
