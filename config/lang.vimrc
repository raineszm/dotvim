" vim: foldmethod=marker
"
" Language Specific Settings {{{

" Fortran {{{
let fortran_free_source=1
let fortran_have_tabs=1
" }}}

" LaTeX {{{
" vimtex {{{
let g:vimtex_latexmk_progname = 'nvr'
if has('macunix')
    let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'

    " This adds a callback hook that updates Skim after compilation
    let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
    function! UpdateSkim(status)
        if !a:status | return | endif

        let l:out = b:vimtex.out()
        let l:tex = expand('%:p')
        let l:cmd = [g:vimtex_view_general_viewer, '-r']
        if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
        endif
        if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
        elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
        else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
        endif
    endfunction
else
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_use_temp_files = 1
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

" MATHEMATICA STUFF {{{
let g:mma_candy=2
" let g:filetype_m = 'mma'
augroup mathematicaauto
    autocmd!
    autocmd! BufNewFile,BufRead *.mma set filetype=mma
augroup END
" }}}

" HASKELL STUFF {{{

augroup haskellauto
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END
" }}}

" }}}

" Cython {{{
let g:filetype_pyx = 'cython'
" }}}

" Python {{{
nnoremap <Plug>(yapfify-buffer) :0,$!yapf<CR>
augroup pythonauto
 autocmd!
 autocmd! FileType python nmap <buffer> <LocalLeader>= <Plug>(yapfify-buffer)
 autocmd! BufWritePost,BufEnter *.py Neomake
augroup END

let g:jedi#goto_command = "<localleader>d"
let g:jedi#goto_assignments_command = "<localleader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<localleader>n"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<localleader>r"

let g:jedi#completions_enabled = 0

" }}


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

" }}}

