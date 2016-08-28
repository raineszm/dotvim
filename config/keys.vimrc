" vim: foldmethod=marker
" General Keymaps {{{
"Insert date
function! Today()
    execute "normal! \"=strftime('%Y-%m-%d')\<cr>p"
endfunction
command! Today call Today()

cnoremap <C-g> <esc>

if maparg('<leader>:', 'n') != ""
    nunmap <leader>:
end
nnoremap <Plug>(M-x) :call SpacevimCommands()<CR>
nmap <leader><leader> <Plug>(M-x)

" }}}
"
" Window Management {{{
if maparg('<leader>wc', 'n') != ""
    nunmap <leader>wc
end
nnoremap <Plug>(delete-window) :q<cr>
nmap <Leader>wd <Plug>(delete-window)
" }}}

" {{{ FZF
nnoremap <Plug>(fzf-lines) :BLines<CR>
nmap <Leader>ss <Plug>(fzf-lines)

nnoremap <Plug>(fzf-tags) :BTags<CR>
nmap <Leader>sj <Plug>(fzf-tags)
" }}}

" Startify {{{
nnoremap <Leader>bh :Startify<cr>
" }}}

" vim-leader-guide {{{
nnoremap <localleader> :<c-u>LeaderGuide  ','<CR>
vnoremap <localleader> :<c-u>LeaderGuideVisual  ','<CR>
" " This variant won't habe any group names.

" " Group names can be defined by filetype. Add the following lines:
" let g:llmap = {}
" autocmd FileType tex let g:llmap.l = { 'name' : 'vimtex' }
" call leaderGuide#register_prefix_descriptions(",", "g:llmap")
" " to name the <localleader>-n group vimtex in tex files.
" }}}

" Incsearch {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}

" Error checking {{{
nnoremap <SPACE>el :lopen<cr>
nnoremap <SPACE>en :lnext<cr>
nnoremap <SPACE>ep :lprevious<cr>
nnoremap <SPACE>eN :lprevious<cr>
" }}}
