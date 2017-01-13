" vim: foldmethod=marker

" Plug Config {{{

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/dein')
call dein#begin('~/.config/nvim/dein', [expand('<sfile>')] )

" Load plugins from TOML file
call dein#load_toml('~/.config/nvim/config/dein.toml', {})

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
