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
Plug 'mhinz/vim-startify'

"Search and movement plugins
Plug 'justinmk/vim-dirvish'
Plug 'matchit.zip'
Plug 'haya14busa/incsearch.vim'
Plug 'pelodelfuego/vim-swoop'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/braceless.vim'

" Undo
Plug 'mbbill/undotree'

"Completion Tools
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'"

"Error Checking
Plug 'neomake/neomake'

"Source formatting
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'

"Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Project stuff
Plug 'dbakker/vim-projectroot'

"Build/Run Tools
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'

"Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Colors
Plug 'lifepillar/vim-solarized8'

"Utilities
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-speeddating'
Plug 'kassio/neoterm'
if has('macunix')
    Plug 'rizzatti/dash.vim'
elseif has('unix')
    Plug 'KabbAmine/zeavim.vim'
end
Plug 'tpope/vim-repeat'


"Language Specific {{{
"-----------------------

"Org
Plug 'jceb/vim-orgmode', { 'for':  'org' }

"Latex
Plug 'lervag/vimtex', { 'for': 'tex' }

"Python
Plug 'tshirtman/vim-cython', { 'for': 'cython' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

"Haskell
Plug 'Twinside/vim-haskellConceal', { 'for': 'haskell'}
Plug 'Twinside/vim-hoogle', { 'for': 'haskell'}
Plug 'travitch/hasksyn', { 'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell'}
Plug 'eagletmt/neco-ghc', { 'for': 'haskell'}

"Mathematica
Plug 'rsmenon/vim-mathematica'

"HTML
Plug 'mattn/emmet-vim'
"Stylus
Plug 'wavded/vim-stylus'

"Markdown
Plug 'plasticboy/vim-markdown'

"Julia
Plug 'JuliaLang/julia-vim'
Plug 'JuliaEditorSupport/deoplete-julia'

"JS
Plug 'pangloss/vim-javascript'

" Clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure'}
Plug 'tpope/vim-fireplace', { 'for': 'clojure'}
Plug 'tpope/vim-leiningen', { 'for': 'clojure'}
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure'}
Plug 'guns/vim-slamhound', { 'for': 'clojure'}

"Ruby
Plug 'ngmy/vim-rubocop', { 'for': 'ruby'}

"R
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rnoweb', 'rmd'] }

"Rust
Plug 'rust-lang/rust.vim'
"Plug 'phildawes/racer', { 'do': 'cargo build --release', 'for': 'rust' }

"Fish
Plug 'dag/vim-fish'

"Asymptote
Plug 'hura/vim-asymptote'

" }}}

" }}}

call plug#end()
" }}}
