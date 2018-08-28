" vim: foldmethod=marker
"

" Fortran {{{
let fortran_free_source=1
let fortran_have_tabs=1
" }}}

" LaTeX {{{
" vimtex {{{
let g:vimtex_compiler_progname = 'nvr'
if has('macunix')
    let g:vimtex_view_method = 'skim'
else
    let g:vimtex_view_method = 'zathura'
    " let g:vimtex_view_use_temp_files = 1
endif
let g:vimtex_latexmk_background = 1

augroup vimtex_cm_setup
autocmd!
autocmd Filetype tex call ncm2#register_source({
        \ 'name': 'vimtex',
        \ 'priority': 8,
        \ 'scope': ['tex'],
        \ 'mark': 'tex',
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
augroup END

"}}}

augroup latexSurround
 autocmd!
 autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
 let b:surround_{char2nr('e')}
   \ = '\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}'
 let b:surround_{char2nr('c')} = '\\\1command: \1{\r}'
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

" HASKELL STUFF {{{

augroup haskellauto
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END
" }}}

" Cython {{{
let g:filetype_pyx = 'cython'
" }}}

" Python {{{
augroup pythonauto
    autocmd!
    autocmd FileType python BracelessEnable +indent
augroup END

augroup pythonfmt
  autocmd!
  autocmd BufWritePre python undojoin | Neoformat
augroup END

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" Jedi settings
let g:jedi#goto_command = '<localleader>d'
let g:jedi#goto_assignments_command = '<localleader>g'
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<localleader>n'
let g:jedi#completions_command = ''
let g:jedi#rename_command = '<localleader>r'

let g:jedi#force_py_version = 3

" }}}

" Markdown{{{
let g:vim_markdown_math = 1

let g:macnote_note_directory = expand('$HOME/Dropbox/sync/macnote')
" }}}

" Ruby {{{
augroup rubyauto
    autocmd!
    autocmd! FileType ruby setlocal softtabstop=2 shiftwidth=2 expandtab
augroup END
" }}}

" R {{{

if !has('macunix')
    let vimrplugin_pdfviewer = 'zathura'
end

if $DISPLAY !=? ''
    let vimrplugin_openpdf = 1
endif

let vimrplugin_latexcmd = 'latexmk -pdf'

let vimrplugin_openhtml = 1
let vimrplugin_insert_mode_cmds = 0
let vimrplugin_assign = 0

let vimrplugin_applescript = 0

" }}}
"
" Cpp {{{
let g:load_doxygen_syntax = 1

" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/ccls/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif
" }}}

" }}}

