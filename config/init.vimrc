" vim: foldmethod=marker

" Plug Config {{{

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.config/nvim/dein'))
call dein#begin(expand('~/.config/nvim/dein'), [expand('<sfile>')] )

" Let dein manage dein
" Required:
call dein#add(expand('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim'))

" Plugin imports {{{

"General dependencies
call dein#add('hecal3/vim-leader-guide')
call dein#add('ctjhoa/spacevim')
if !has('nvim')
    call dein#add('tpope/vim-sensible')
end
call dein#add('mhinz/vim-startify')

"Search and movement plugins
call dein#add('justinmk/vim-dirvish')
call dein#add('justinmk/vim-sneak')
call dein#add('pelodelfuego/vim-swoop')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-unimpaired')
call dein#add('tweekmonster/braceless.vim')

" Undo
call dein#add('mbbill/undotree')

"Completion Tools
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-jedi', { 'on_ft': 'python' })

"Unite
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')

" Snippets
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

"Error Checking
call dein#add('neomake/neomake')

"Source formatting
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('editorconfig/editorconfig-vim')

"Git stuff
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')

"Project stuff
call dein#add('dbakker/vim-projectroot')

"Build/Run Tools
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-eunuch')

"Status Line
call dein#add('rafi/vim-tinyline')

"Colors
call dein#add('lifepillar/vim-solarized8')

"Utilities
call dein#add('junegunn/vim-peekaboo')
if has('macunix')
    call dein#add('rizzatti/dash.vim')
elseif has('unix')
    call dein#add('KabbAmine/zeavim.vim')
end
call dein#add('tpope/vim-repeat')

"Subregion
"
call dein#add('chrisbra/NrrwRgn')


"Language Specific {{{
"-----------------------

"Org
call dein#add('jceb/vim-orgmode', { 'on_ft':  'org' })

"Latex
call dein#add('lervag/vimtex', { 'on_ft': 'tex' })

"Python
call dein#add('tshirtman/vim-cython', { 'on_ft': 'cython' })
call dein#add('hynek/vim-python-pep8-indent', { 'on_ft': 'python' })
call dein#add('davidhalter/jedi-vim', { 'on_ft': 'python' })

"Haskell
call dein#add('Twinside/vim-haskellConceal', { 'on_ft': 'haskell'})
call dein#add('travitch/hasksyn', { 'on_ft': 'haskell'})
call dein#add('eagletmt/neco-ghc', { 'on_ft': 'haskell'})

"Mathematica
call dein#add('rsmenon/vim-mathematica')

"HTML
call dein#add('mattn/emmet-vim')
"
"Stylus
call dein#add('wavded/vim-stylus')

"Markdown
call dein#add('plasticboy/vim-markdown')

"Julia
call dein#add('JuliaLang/julia-vim')
call dein#add('JuliaEditorSupport/deoplete-julia', {'on_ft': 'julia'})

"JS
call dein#add('pangloss/vim-javascript')

" Clojure
call dein#add('guns/vim-clojure-static', { 'on_ft': 'clojure'})
call dein#add('tpope/vim-fireplace', { 'on_ft': 'clojure'})
call dein#add('tpope/vim-leiningen', { 'on_ft': 'clojure'})
call dein#add('guns/vim-clojure-highlight', { 'on_ft': 'clojure'})
call dein#add('guns/vim-slamhound', { 'on_ft': 'clojure'})

"Ruby
call dein#add('ngmy/vim-rubocop', { 'on_ft': 'ruby'})

"R
call dein#add('jalvesaq/Nvim-R', { 'on_ft': ['r', 'rnoweb', 'rmd'] })

"Rust
call dein#add('rust-lang/rust.vim')

"Fish
call dein#add('dag/vim-fish')

"Asymptote
call dein#add('hura/vim-asymptote')

" }}}

" }}}
" Required:
call dein#end()
call dein#save_state()
endif

let g:dein#install_progress_type="tabline"


if dein#check_install()
  call dein#install()
  call dein#remote_plugins()
endif

filetype plugin indent on
syntax enable

" }}}
