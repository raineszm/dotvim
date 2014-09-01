" vim: foldmethod=marker
" Load the vim scripts in the bundle directory

" NeoBundle Config {{{
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugin imports {{{

"General dependencies
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

"Search and movement plugins
NeoBundle 'mileszs/ack.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'matchit.zip'

"Completion Tools
" NeoBundle 'ervandew/supertab'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets' "Default snippets for ultisnips
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'eagletmt/neco-ghc'

"Error Checking
NeoBundle 'scrooloose/syntastic'

"Source formatting
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'oblitum/rainbow'

"Git stuff
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

"Status Line
NeoBundle 'bling/vim-airline'

"Colors
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'junegunn/limelight.vim'

"Wiki
NeoBundle 'vimwiki/vimwiki'

"External/Shell
NeoBundle 'Shougo/vimshell.vim'

"Language Specific {{{
"-----------------------

"Latex
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'

"Python
NeoBundle 'tshirtman/vim-cython'

"Haskell
NeoBundle 'Twinside/vim-haskellConceal'
" NeoBundle 'enomsg/vim-haskellConcealPlus'
NeoBundle 'travitch/hasksyn'
NeoBundle 'eagletmt/ghcmod-vim'

"Mathematica
NeoBundle 'rsmenon/vim-mathematica'
" }}}

" }}}

call neobundle#end()

NeoBundleCheck
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

"Turn on modeline
set modeline

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

" Turn on necomplete
let g:neocomplete#enable_at_startup = 1
let g:acp_enableAtStartup = 0

" Take over completefunc
let g:neocomplete#force_overwrite_completefunc = 1


if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><C-y> neocomplete#close_popup()

function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

augroup haskellauto
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END
" }}}

" Language Specific Settings {{{
" LaTeX {{{
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

" LaTeX completion {{{
let neocomplete#force_omni_input_patterns.tex = '\\\h\w*{'
"}}}
" }}}

" MATHEMATICA STUFF {{{
let g:mma_candy=2
let g:filetype_m = 'mma'
augroup mathematicaauto
    autocmd!
    autocmd! BufNewFile,BufRead *.mma set filetype=mma
    autocmd! FileType mma setlocal commentstring=(*%s*)
    autocmd! FileType mma let b:match_words = '\[:\]'
augroup END

let g:tagbar_type_mma = {
    \ 'ctagstype' : 'Mathematica',
    \ 'kinds' : [
    \ 'f:functions',
    \ 'v:variables'
    \]}
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

" General Keymaps {{{
" Vim editing
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
nnoremap <leader>sv :source ~/.vim/vimrc<cr>

"Tagbar settings
nnoremap <leader>tb :Tagbar<cr>

" }}}

" Unite {{{
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <leader>lb :Unite buffer<cr>
" <TAB>: completion.
" }}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e

