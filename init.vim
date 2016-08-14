" vim: foldmethod=marker
" Load the vim scripts in the bundle directory
let mapleader = "\<Space>"

" Plug Config {{{

" Required:
call plug#begin('~/.config/nvim/plugged')

" Plugin imports {{{

"General dependencies
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'hecal3/vim-leader-guide'
Plug 'ctjhoa/spacevim'
Plug 'tpope/vim-sensible'

"Search and movement plugins
Plug 'tpope/vim-vinegar'
Plug 'matchit.zip'

" Undo
Plug 'mbbill/undotree'

"Doc
Plug 'jez/vim-superman'

"Completion Tools
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Error Checking
Plug 'scrooloose/syntastic'

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

Plug 'mtth/scratch.vim'

"Colors
Plug 'altercation/vim-colors-solarized'

"Utilities
Plug 'junegunn/vim-peekaboo'

"Language Specific {{{
"-----------------------

"Latex
Plug 'lervag/vimtex'

"Python
Plug 'tshirtman/vim-cython', { 'for': 'cython' }
Plug 'zchee/deoplete-jedi'

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

"Python
Plug 'davidhalter/jedi-vim'

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

" Basic Settings {{{
"Get some nice syntax highlighting and language features
" syntax on
" filetype plugin indent on
" Commented stuff already set by sensible

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
colorscheme solarized

set guifont=Source\ Code\ Pro

" }}}

" Completion {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Language Specific Settings {{{

" Fortran {{{
let fortran_free_source=1
let fortran_have_tabs=1
" }}}

" LaTeX {{{
" vimlatex {{{
if has('macunix')
  let g:vimtex_view_general_viewer
    \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
else
    let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_latexmk_background = 1

augroup latexSurround
 autocmd!
 autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
 let b:surround_{char2nr("e")}
   \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
 let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction
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

" R {{{

if !has('macunix')
    let vimrplugin_pdfviewer = "zathura"
end

if $DISPLAY != ""
    let vimrplugin_openpdf = 1
endif

" let vimrplugin_latexmk = 0
" let vimrplugin_latexcmd = 'latexmk -pdf -pdflatex="xelatex %O -synctex=1 %S"'
let vimrplugin_latexcmd = 'latexmk -pdf'

let vimrplugin_openhtml = 1
let vimrplugin_insert_mode_cmds = 0
let vimrplugin_assign = 0

let vimrplugin_applescript = 0

" }}}

" Cpp {{{
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
" }}}

" }}}

" General Keymaps {{{
"Insert date
function! Today()
    execute "normal! \"=strftime('%Y-%m-%d')\<cr>p"
endfunction
command! Today call Today()

cnoremap <C-g> <esc>

" }}}
"
" Window Management {{{
nnoremap <Plug>(delete-window) :q<cr>
nmap <Leader>wd <Plug>(delete-window)
" }}}

" External tools {{{
if executable('ag')
    set grepprg=ag\ --nocolor\ --nogroup
endif

" }}}

" {{{ FZF
nnoremap <Plug>(fzf-swoop) :Lines<CR>
nmap <Leader>ss <Plug>(fzf-swoop)
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
