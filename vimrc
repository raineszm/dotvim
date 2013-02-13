"Load the vim scripts in the bundle directory

filetype off
set runtimepath+=~/.vim/vundle
call vundle#rc()

Bundle 'a.vim'
Bundle 'ack.vim'
Bundle 'gmarik/snipmate.vim'
Bundle 'clang-complete'
Bundle 'Markdown'
Bundle 'LustyExplorer'
Bundle 'pydoc.vim'
Bundle 'taglist.vim'
Bundle 'indenthaskell.vim'
Bundle 'VimClojure'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle "~/Documents/Programming/pcgen/pcgenvim.git"

"Don't worry about not having ruby for LustyJuggler
let g:LustyJugglerSuppressRubyWarning = 1

"Get some nice syntax highlighting and language features
let fortran_free_source=1
let fortran_have_tabs=1
syntax on
filetype plugin indent on

"Set the default indent
set shiftwidth=2
set softtabstop=2
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

inoremap <C-J> <Esc>o
nnoremap <C-J> o<Esc>

let g:alternateExtensions_cc="hh"
let g:alternateExtensions_hh="cc"

let g:clang_use_library=1
let g:clang_library_path="/usr/local/lib"
let g:clang_snippets=1

"VimClojure settings
let vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 0

"Vim-Latex
set grepprg=grep\ -nH\ $*
let g:Tex_ViewRule_pdf='Skim'
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'latexmk -cd -pdf -f $*'
let g:Tex_CompileRule_pdf = "latexmk -cd -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 %S' -pdf -f $*"

