" vim: foldmethod=marker
" Load the vim scripts in the bundle directory

" Plug Config {{{
if has('vim_starting')
    set nocompatible               " Be iMproved
endif

" Required:
call plug#begin('~/.vim/plugged')

" Plugin imports {{{

"General dependencies
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'tpope/vim-sensible'

"Search and movement plugins
Plug 'mileszs/ack.vim'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'
Plug 'tsukkee/unite-tag'
Plug 'matchit.zip'

"Completion Tools
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' "Default snippets for ultisnips
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'eagletmt/neco-ghc'

"Error Checking
Plug 'scrooloose/syntastic'

"Source formatting
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'oblitum/rainbow'

"Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Status Line
Plug 'bling/vim-airline'

"Colors
Plug 'chriskempson/base16-vim'

"Wiki
Plug 'vimwiki/vimwiki'
Plug 'davidoc/taskpaper.vim'

Plug 'mtth/scratch.vim'

"Markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

"Language Specific {{{
"-----------------------

"Latex
Plug 'LaTeX-Box-Team/LaTeX-Box'

"Python
Plug 'tshirtman/vim-cython'

"Haskell
Plug 'Twinside/vim-haskellConceal'
" Plug 'enomsg/vim-haskellConcealPlus'
Plug 'Twinside/vim-hoogle'
Plug 'travitch/hasksyn'
Plug 'eagletmt/ghcmod-vim'

"Mathematica
Plug 'rsmenon/vim-mathematica'

"Julia
Plug 'JuliaLang/julia-vim'

" }}}

" }}}

call plug#end()
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
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-chalk

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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


augroup haskellauto
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END
" }}}

" Language Specific Settings {{{
" LaTeX {{{
" LatexBox {{{
let g:LatexBox_latexmk_async = 1
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

" Julia {{{
" Disable Julia autocompletion that doesn't play nice
" with youcompleteme
let g:latex_to_unicode_tab = 0
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds' : [
    \ 'f:functions',
    \]}
" }}}

" MATHEMATICA STUFF {{{
let g:mma_candy=2
let g:filetype_m = 'mma'
augroup mathematicaauto
    autocmd!
    autocmd! BufNewFile,BufRead *.mma set filetype=mma
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

let g:syntastic_haskell_checkers = ['ghc-mod', 'hlint']
" }}}

" Cython {{{
let g:filetype_pyx = 'cython'
" }}}

" TaskPaper {{{
let g:task_paper_styles = {
            \ 'FAIL': 'guibg=Red guifg=White',
            \ 'figures': 'guibg=Magenta ctermfg=Magenta',
            \ 'rewrite': 'term=reverse ctermfg=15 ctermbg=9'
            \ }
" }}}

" }}}

" General Keymaps {{{
" Vim editing
execute 'nnoremap <leader>ev :vsplit'.resolve(expand($MYVIMRC)).'<cr>'
execute 'nnoremap <leader>sv :source'.resolve(expand($MYVIMRC)).'<cr>'

"Tagbar settings
nnoremap <leader>tb :Tagbar<cr>

" }}}

" External tools {{{
if executable('ag')
    set grepprg=ag\ --nocolor\ --nogroup
endif
" }}}

" Unite {{{
" Set up fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Set unite to use ag
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '-i --noheading --nocolor --nogroup'
endif

nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <leader>lb :Unite buffer<cr>
nnoremap <leader>gr :Unite grep:. -auto-preview<cr>
" }}}

" Runtime Plugins"{{{
runtime! ftplugin/man.vim
"}}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e

