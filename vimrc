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
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'
Plug 'tsukkee/unite-tag'
Plug 'matchit.zip'

" Undo
Plug 'mbbill/undotree'

"Doc
Plug 'jez/vim-superman'

"Completion Tools
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

"Error Checking
Plug 'scrooloose/syntastic'

"Source formatting
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'calebsmith/vim-lambdify'

"Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Build/Run Tools
Plug 'tpope/vim-dispatch'
Plug 'jalvesaq/vimcmdline'

"Status Line
Plug 'bling/vim-airline'

"Colors
Plug 'chriskempson/base16-vim'

"Wiki
Plug 'davidoc/taskpaper.vim'
Plug 'neilagabriel/vim-geeknote'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/utl.vim'

Plug 'mtth/scratch.vim'

"Plugin Devel
Plug 'tpope/vim-scriptease'
Plug 'junegunn/vader.vim'

Plug '~/Documents/Programming/Vim/todotxttoo'
Plug '~/Documents/Programming/Vim/vim-julia-doc'

"Language Specific {{{
"-----------------------
"Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

"Latex
Plug 'LaTeX-Box-Team/LaTeX-Box'

"Python
Plug 'tshirtman/vim-cython'

"Haskell
Plug 'Twinside/vim-haskellConceal'
Plug 'Twinside/vim-hoogle'
Plug 'travitch/hasksyn'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

"Mathematica
Plug 'rsmenon/vim-mathematica'

"Julia
Plug 'JuliaLang/julia-vim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-leiningen'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-slamhound'

"Ruby
Plug 'ngmy/vim-rubocop'

"R
Plug 'vim-scripts/Vim-R-plugin'

" }}}

" }}}

call plug#end()
" }}}

" Basic Settings {{{
"Get some nice syntax highlighting and language features
" syntax on
" filetype plugin indent on
" Commented stuff already set by sensible
set t_Co=256

"Set the default indent
set shiftwidth=4
set softtabstop=4
set expandtab

"Basic setting changes
" set incsearch
" set ruler
" set showcmd
set mouse=a

"Set buffers to be hidden instead of closed when switched
set hidden

"Turn on modeline
set modeline

"Set grep command
set grepprg=grep\ -nH\ $*

" Setup the wildmenu {{{
set wildmode=longest:full
" set wildmenu
" }}}
" }}}

" Visual Settings {{{

"Airline
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1

"Color schemes
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-chalk

" }}}

" Completion {{{
" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Neosnippets
"
imap <C-y>     <Plug>(neosnippet_expand_or_jump)
smap <C-y>     <Plug>(neosnippet_expand_or_jump)
xmap <C-y>     <Plug>(neosnippet_expand_target)


" }}}

" Language Specific Settings {{{

" Fortran {{{
let fortran_free_source=1
let fortran_have_tabs=1
" }}}

" LaTeX {{{
" LatexBox {{{
if has('macunix')
    let g:LatexBox_viewer='open -a Skim.app'
    if has('gui')
        let g:LatexBox_latexmk_async = 1
    end
else
    if !has('nvim')
        let g:LatexBox_latexmk_async = 1
        let g:LatexBox_viewer='zathura -s -x "vim --servername VIM --remote-silent +\%{line} \%{input}"'
    end
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

function! DeleteLeftRight()
    let l:cur = getpos('.')
    if searchpair('\\left', '', '\\right', 'b')
        let l:a = getpos("'a")
        normal ma%dft`adft
        call setpos("'a", l:a)
        call setpos('.', l:cur)
    endif
endfunction

autocmd FileType tex command! -buffer DLR call DeleteLeftRight()

nnoremap <leader>ls :call LatexForwardSearch()<cr>
nmap <c-l><c-e> <Plug>LatexChangeEnv
vmap <c-l><c-e> <Plug>LatexWrapEnvSelection
" }}}

" Latex Conceal Options {{{
let g:tex_conceal= 'abdgm'
hi Conceal guibg=Black guifg=White ctermbg=Black ctermfg=White
augroup latexauto
    autocmd!
    autocmd FileType tex setlocal conceallevel=2
augroup END
" }}}
" }}}

" Julia {{{
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds' : [
    \ 'f:functions',
    \ 't:types',
    \ 'c:constants'
    \]}
" }}}

" MATHEMATICA STUFF {{{
let g:mma_candy=2
" let g:filetype_m = 'mma'
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

augroup haskellauto
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

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
let s:urgent_style = 'term=reverse ctermfg=White ctermbg=DarkRed guifg=White guibg=DarkRed'
let g:task_paper_styles = {
            \ 'FAIL': 'guibg=Red guifg=White',
            \ 'figures': 'guifg=Magenta ctermfg=Magenta',
            \ 'rewrite': 'term=reverse ctermfg=Black ctermbg=Red guifg=Black guibg=Red',
            \ 'urgent': s:urgent_style,
            \ 'important': s:urgent_style,
            \ 'flagged': s:urgent_style,
            \ 'due': 'ctermbg=Yellow guibg=Yellow ctermfg=Brown guifg=Brown',
            \ 'today': 'ctermbg=Blue guibg=Blue ctermfg=Brown guifg=Brown'
            \ }
" }}}

" Ruby {{{
augroup rubyauto
    autocmd!
    autocmd! FileType ruby setlocal softtabstop=2 shiftwidth=2 expandtab

augroup END
" }}}

" }}}

" General Keymaps {{{
" Vim editing
execute 'nnoremap <leader>ev :vsplit'.resolve(expand($MYVIMRC)).'<cr>'
execute 'nnoremap <leader>sv :source'.resolve(expand($MYVIMRC)).'<cr>'

"Tagbar settings
nnoremap <leader>tb :Tagbar<cr>

"Insert date
function! Today()
    execute "normal! \"=strftime('%Y-%m-%d')\<cr>p"
endfunction
command! Today call Today()

" }}}

" External tools {{{
if executable('ag')
    set grepprg=ag\ --nocolor\ --nogroup
endif

let g:GeeknoteFormat='markdown'
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

" Remote editing {{{
function! RemoteConfiguration()
    inoremap jk <esc>
    vnoremap jk <esc>
    colorscheme default
    return
endfunction

command! SSHConfig call RemoteConfiguration()
" }}}

" Trim trailing whitespace on save because it sucks
autocmd BufWritePre * keepjumps %s/\v\s+$//e

