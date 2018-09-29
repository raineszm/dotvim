" vim: foldmethod=marker

" Dein Config {{{
"
" Make sure dein is instaled
let s:dein_dir = $HOME . '/.config/nvim/dein/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

" Required:
execute 'set runtimepath^=' . substitute(
    \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')

let g:dein#enable_notification = 1

" Required:
if dein#load_state('~/.config/nvim/dein')
call dein#begin('~/.config/nvim/dein', [expand('<sfile>')] )

" Load plugins from TOML file
call dein#load_toml('~/.config/nvim/config/dein.toml')

"Load ftplugins from toml
call dein#load_toml('~/.config/nvim/config/ftplugin.toml')

" Required:
call dein#end()
call dein#save_state()
endif

let g:dein#install_progress_type='tabline'

if dein#check_install()
  call dein#install()
  call dein#remote_plugins()
endif

filetype plugin indent on
syntax enable

" }}}
