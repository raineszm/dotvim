" vim: foldmethod=marker
" Load the vim scripts in the bundle directory

" Vundle Config {{{
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin imports {{{
"Keep vundle up to date
Plugin 'gmarik/Vundle.vim'

"General depdndencies
Plugin 'Shougo/vimproc'

"Search and movement plugins
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'majutsushi/tagbar'

"Completion Tools
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' "Default snippets for ultisnips
Plugin 'Valloric/YouCompleteMe'
Plugin 'eagletmt/neco-ghc'

"Error Checking
Plugin 'scrooloose/syntastic'

"Source formatting
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'oblitum/rainbow'

"Git stuff
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

"Status Line
Plugin 'bling/vim-airline'

"Colors
Plugin 'chriskempson/base16-vim'

"Wiki
Plugin 'vimwiki/vimwiki'

"Language Specific {{{
"-----------------------

"Latex
Plugin 'LaTeX-Box-Team/LaTeX-Box'

"Python
Plugin 'tshirtman/vim-cython'

"Haskell
Plugin 'Twinside/vim-haskellConceal'
" Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'travitch/hasksyn'
Plugin 'eagletmt/ghcmod-vim'

"Mathematica
Plugin 'rsmenon/vim-mathematica'
" }}}

" }}}

call vundle#end()
" }}}

" Basic Settings {{{
"Get some nice syntax highlighting and language features
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

"Set grep command
set grepprg=grep\ -nH\ $*

" Setup the wildmenu {{{
set wildmode=longest:full
set wildmenu
" }}}
" }}}

" Visual Settings {{{

"Airline
set laststatus=2
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1

"Color schemes
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme base16-ashes

"RAINBOW STUFF
autocmd FileType * call rainbow#load()
autocmd FileType haskell call rainbow#load([['(', ')'], ['\[', '\]']], '')
autocmd FileType mma call rainbow#load([['(\(\*\)\@!', '\(\*\)\@<!)'], ['\(\\\)\@<!\[','\]'], ['{', '}']], '')

" }}}

" Fortran {{{
let fortran_free_source=1
let fortran_have_tabs=1
" }}}

" Completion {{{
" Completion Shenanigans
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
augroup haskellauto
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END
" }}}

" Language Specific Settings {{{
" LATEX {{{
" LatexBox {{{
let g:LatexBox_latexmk_options = "-pdflatex='pdflatex -synctex=1 \%O \%S'"
if has('macunix')
    let g:LatexBox_viewer='open -a Skim.app'
else
    let g:LatexBox_viewer='zathura -s -x "vim --servername VIM --remote-silent +\%{line} \%{input}"'
endif

"Forward Search for latex
function! LatexForwardSearch()
    let lineno = line('.')
    let colno = col('.')
    let texfile = expand('%:p')
    let pdffile = expand('%:p:r').'.pdf'
    if has('macunix')
        call system('/Applications/Skim.app/Contents/SharedSupport/displayline -g '
                    \ .lineno.' "'.pdffile.'" "'.texfile.'"')
    else
        call system('zathura -s --synctex-forward='
                    \ .lineno.':'.colno.':'.texfile.' '.pdffile.' >/dev/null&')
    endif
endfunction

nnoremap <leader>ls :call LatexForwardSearch()<cr>
nmap <c-l><c-e> <Plug>LatexChangeEnv
vmap <c-l><c-e> <Plug>LatexWrapEnvSelection
" }}}

" Latex Conceal Options {{{
let g:tex_conceal= 'abdgm'
hi Conceal guibg=Black guifg=White
hi Conceal ctermbg=Black ctermfg=White
augroup latexauto
    autocmd!
    autocmd FileType tex setlocal cole=2
augroup END
" }}}
" }}}

" MATHEMATICA STUFF {{{
let g:mma_candy=2
let g:filetype_m = 'mma'
augroup mathematicaauto
    autocmd!
    autocmd! FileType mma setlocal commentstring=(*%s*)
augroup END
" }}}

" HASKELL STUFF {{{
" Build a tag file for tagbar {{{
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
    \ }
" }}}

" let g:syntastic_haskell_checkers = ['ghc-mod', 'hlint']
" }}}

" }}}

" Settings for GUI {{{
" Set fonts
" Make things bit more readable in macvim
if has('macunix')
    set guifont=Menlo:h13
endif

" Turn off scrollbars
set guioptions-=L
set guioptions-=l
set guioptions-=r
set guioptions-=T
" }}}

" General Keymaps {{{
" Vim editing
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
nnoremap <leader>sv :source ~/.vim/vimrc<cr>

"NERDTree settings
nnoremap <leader>nt :NERDTreeToggle<cr>

" }}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e


