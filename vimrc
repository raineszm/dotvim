" Load the vim scripts in the bundle directory

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ack.vim'
Plugin 'SirVer/ultisnips'
Plugin 'kien/ctrlp.vim'
Plugin 'rainbow_parentheses.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'JuliaLang/julia-vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tComment'
Plugin 'scrooloose/nerdTree'
Plugin 'tshirtman/vim-cython'
Plugin 'Haskell-Conceal'
Plugin 'travitch/hasksyn'

call vundle#end()

"Get some nice syntax highlighting and language features
let fortran_free_source=1
let fortran_have_tabs=1
syntax on
filetype plugin indent on

"Set the default indent
set shiftwidth=4
set softtabstop=4
set expandtab

"Basic setting changes
set incsearch
set ruler
set showcmd

"Set buffers to be hidden instead of closed when switched
set hidden

"Setup the wildmenu
set wildmode=longest:full
set wildmenu

"Color Setup
colorscheme ir_black

let g:clang_use_library=1
let g:clang_library_path="/usr/local/lib"
let g:clang_snippets=1

"rainbow-parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
let g:rbpt_max = 16

"LatexBox
set grepprg=grep\ -nH\ $*
if has('macunix')
    let g:LatexBox_viewer='Skim'
else
    let g:LatexBox_viewer='xdg-open'
endif

"tComment Settings
map <C-/> TComment
