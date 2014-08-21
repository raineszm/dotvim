" Load the vim scripts in the bundle directory

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Keep vundle up to date
Plugin 'gmarik/Vundle.vim'

"Search and movement plugins
Plugin 'ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdTree'

"Completion Tools
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' "Default snippets for ultisnips
Plugin 'Valloric/YouCompleteMe'
Plugin 'eagletmt/neco-ghc'

"Error Checking
Plugin 'scrooloose/syntastic'

"Source formatting
Plugin 'tComment'
Plugin 'rainbow_parentheses.vim'

"Status Line
Plugin 'bling/vim-airline'


"Language Specific
"-----------------------

"Latex
Plugin 'LaTeX-Box-Team/LaTeX-Box'

"Python
Plugin 'tshirtman/vim-cython'

"Haskell
Plugin 'Haskell-Conceal'
Plugin 'travitch/hasksyn'

call vundle#end()

"Get some nice syntax highlighting and language features
let fortran_free_source=1
let fortran_have_tabs=1
syntax on
filetype plugin indent on
set t_Co=256

"Set the default indent
set shiftwidth=4
set softtabstop=4
set expandtab

"Basic setting changes
set incsearch
set ruler
set showcmd
set mouse=a

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

"Completion Shenanigans
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

"Youcompleteme for Haskell
let g:ycm_semantic_triggers = {'haskell' : ['.']}
autocmd FileType haskell set omnifunc=necoghc#omnifunc

"LatexBox
set grepprg=grep\ -nH\ $*
let g:LatexBox_latexmk_options = "-pdflatex='pdflatex -synctex=1 \%O \%S'"
if has('macunix')
    let g:LatexBox_viewer='Skim'
else
    let g:LatexBox_viewer='zathura -s -x "vim --servername VIM --remote-silent +\%{line} \%{input}"'
endif

"Forward Search for latex
function! LatexForwardSearch()
    call system('zathura -s --synctex-forward='.line('.').':'.col('.').':'.expand('%:p').' '.expand('%:p:r').'.pdf >/dev/null&')
endfunction
nnoremap <leader>ls :call LatexForwardSearch()<cr>

"tComment Settings
nnoremap <leader>cc :TComment<cr>

"Airline
set laststatus=2
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
