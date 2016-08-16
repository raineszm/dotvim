" vim: foldmethod=marker
let mapleader = "\<Space>"

" Plug Config {{{

" Required:
call plug#begin('~/.config/nvim/plugged')

" Plugin imports {{{

"General dependencies
Plug 'hecal3/vim-leader-guide'
Plug 'ctjhoa/spacevim'
Plug 'tpope/vim-sensible'
Plug 'Shougo/vimproc', { 'do': 'make' }

"Search and movement plugins
Plug 'tpope/vim-vinegar'
Plug 'matchit.zip'
Plug 'osyo-manga/vim-over'

" Undo
Plug 'mbbill/undotree'

"Doc
Plug 'jez/vim-superman'

"Completion Tools
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-jedi'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Error Checking
Plug 'neomake/neomake'

"Source formatting
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'calebsmith/vim-lambdify'

"Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Project stuff
Plug 'dbakker/vim-projectroot'

"Build/Run Tools
Plug 'tpope/vim-dispatch'

"Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Colors
Plug 'lifepillar/vim-solarized8'

"Utilities
Plug 'mtth/scratch.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kassio/neoterm'

"Language Specific {{{
"-----------------------

"Latex
Plug 'lervag/vimtex'

"Python
Plug 'tshirtman/vim-cython', { 'for': 'cython' }
Plug 'hynek/vim-python-pep8-indent'

"Haskell
Plug 'Twinside/vim-haskellConceal', { 'for': 'haskell'}
Plug 'Twinside/vim-hoogle', { 'for': 'haskell'}
Plug 'travitch/hasksyn', { 'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell'}
Plug 'eagletmt/neco-ghc', { 'for': 'haskell'}

"Mathematica
Plug 'rsmenon/vim-mathematica'

"Julia
Plug 'JuliaLang/julia-vim'

" Clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure'}
Plug 'tpope/vim-fireplace', { 'for': 'clojure'}
Plug 'tpope/vim-leiningen', { 'for': 'clojure'}
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure'}
Plug 'guns/vim-slamhound', { 'for': 'clojure'}

"Ruby
Plug 'ngmy/vim-rubocop', { 'for': 'ruby'}

"R
Plug 'vim-scripts/Vim-R-plugin', { 'for': 'r' }

"Rust
Plug 'rust-lang/rust.vim'
"Plug 'phildawes/racer', { 'do': 'cargo build --release', 'for': 'rust' }

"Fish
Plug 'dag/vim-fish'

" }}}

" }}}

call plug#end()
" }}}
