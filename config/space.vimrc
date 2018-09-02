" The following code is modified from the spacevim project
" https://github.com/ctjhoa/spacevim
" under the MIT license which is attached as SPACEVIM_LICENSE
let g:lmap = {}

function! s:spacevim_bind(map, binding, name, value, isCmd)
  if a:isCmd
    let l:value = ':' . a:value . '<cr>'
  else
    let l:value = a:value
  endif
  if a:map ==# 'map' && maparg('<Leader>' . a:binding, '') ==# ''
    let l:noremap = 'noremap'
  elseif a:map ==# 'nmap' && maparg('<Leader>' . a:binding, 'n') ==# ''
    let l:noremap = 'nnoremap'
  elseif a:map ==# 'vmap' && maparg('<Leader>' . a:binding, 'v') ==# ''
    let l:noremap = 'vnoremap'
  else
    let l:noremap = ''
  endif

  if l:noremap !=# ''
    execute l:noremap . ' <silent> <SID>' . a:name . '# ' . l:value
    execute a:map . ' <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

function! s:spacevim_bind_plug(map, binding, name, value)
  if a:map ==# 'map' && maparg('<Leader>' . a:binding, '') ==# ''
    let l:map = 'map'
  elseif a:map ==# 'nmap' && maparg('<Leader>' . a:binding, 'n') ==# ''
    let l:map = 'nmap'
  elseif a:map ==# 'vmap' && maparg('<Leader>' . a:binding, 'v') ==# ''
    let l:map = 'vmap'
  else
    let l:map = ''
  endif

  if l:map !=# ''
    execute l:map . ' <silent> <SID>' . a:name . '# <Plug>' . a:value
    execute a:map . ' <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

call s:spacevim_bind('map', '<Tab>', 'last-buffer', 'b#', 1)
call s:spacevim_bind('map', '!', 'shell-cmd', 'call feedkeys(":! ")', 1)
call s:spacevim_bind('map', '/', 'smart-search', 'ProjectRootExe Denite grep', 1)
call s:spacevim_bind('map', '?', 'help', 'Denite help', 1)
call s:spacevim_bind('nmap', '*', 'smart-search-with-input', 'ProjectRootExe DeniteProjectDir grep:`expand("<cword>")`', 1)

" Windows {{{
call s:spacevim_bind('map', '1', 'window-1', '1wincmd w', 1)
call s:spacevim_bind('map', '2', 'window-2', '2wincmd w', 1)
call s:spacevim_bind('map', '3', 'window-3', '3wincmd w', 1)
call s:spacevim_bind('map', '4', 'window-4', '4wincmd w', 1)
call s:spacevim_bind('map', '5', 'window-5', '5wincmd w', 1)
call s:spacevim_bind('map', '6', 'window-6', '6wincmd w', 1)
call s:spacevim_bind('map', '7', 'window-7', '7wincmd w', 1)
call s:spacevim_bind('map', '8', 'window-8', '8wincmd w', 1)
call s:spacevim_bind('map', '9', 'window-9', '9wincmd w', 1)
call s:spacevim_bind('map', '0', 'window-10', '10wincmd w', 1)
" }}}

call s:spacevim_bind('map', '<Space>', 'commands', 'Denite command', 1)

" applications {{{
let g:lmap.a = { 'name': '+applications' }
call s:spacevim_bind('map', 'au', 'undo-tree-visualize', 'UndotreeToggle', 1)

let g:lmap.a.d = { 'name': '+applications/dash' }

call s:spacevim_bind_plug('map', 'adh', 'dash-here', 'DashSearch')
" }}}



" buffers {{{
let g:lmap.b = { 'name': '+buffers' }
call s:spacevim_bind('map', 'bb', 'buffers', 'Denite buffer', 1)
call s:spacevim_bind('map', 'bd', 'kill-this-buffer', 'bdelete', 1)
call s:spacevim_bind('map', 'bh', 'startify', 'Startify', '1')
call s:spacevim_bind('map', 'bn', 'next-useful-buffer', 'bnext', 1)
call s:spacevim_bind('map', 'bp', 'previous-useful-buffer', 'bprevious', 1)
call s:spacevim_bind('map', 'bR', 'safe-revert-buffer', 'e', 1)

" buffers/move {{{
let g:lmap.b.m = { 'name': '+move' }
call s:spacevim_bind('map', 'bmr', 'buf-rotate-down-right', 'wincmd r', 1)
call s:spacevim_bind('map', 'bmR', 'buf-rotate-up-left', 'wincmd R', 1)
" }}}

" }}}
"

" errors {{{
let g:lmap.e = { 'name': '+errors' }
" Error checking {{{
call s:spacevim_bind('map', 'el', 'error-list', 'Denite location_list', 1)
call s:spacevim_bind('map', 'en', 'next-error', 'Denite location_list -resume -cursor-pos="+1"', 1)
call s:spacevim_bind('map', 'eN', 'previous-error', 'Denite location_list -resume -cursor-pos="-1"', 1)
call s:spacevim_bind('map', 'ep', 'previous-error', 'Denite location_list -resume -cursor-pos="-1"', 1)
" }}}
" }}}

" files {{{
let g:lmap.f = { 'name': '+files' }
call s:spacevim_bind('map', 'fA', 'write-all', 'wall', 1)
call s:spacevim_bind('map', 'fc', 'copy-file', 'saveas', 1)
call s:spacevim_bind('map', 'fD', 'delete-current-buffer-file', 'Remove', 1)
call s:spacevim_bind('map', 'fE', 'sudo-edit', 'call feedkeys(":SudoEdit ")', 1)
call s:spacevim_bind('map', 'ff', 'find-files', 'Denite file_rec', 1)
call s:spacevim_bind('map', 'fj', 'junkfile', 'Denite -auto-preview junkfile junkfile:new ', 1)
call s:spacevim_bind('map', 'fL', 'locate', 'call feedkeys(":Locate ")', 1)
call s:spacevim_bind('map', 'fr', 'recentf', 'Denite file_mru', 1)
call s:spacevim_bind('map', 'fR', 'rename-current-buffer-file', 'call feedkeys(":Rename ")', 1)
call s:spacevim_bind('map', 'fs', 'save-buffer', 'write', 1)
call s:spacevim_bind('map', 'fS', 'sudo-write', 'SudoWrite', 1)

" files/vim {{{
let g:lmap.f.e = { 'name': '+files/vim' }
call s:spacevim_bind('map', 'fec', 'find-configs',
    \ 'Denite -buffer-name="configs" file/rec:' . fnamemodify(expand('$MYVIMRC'), ':p:h') . '/config/', 1)
call s:spacevim_bind('map', 'fed', 'find-dotfile', 'edit $MYVIMRC', 1)
call s:spacevim_bind('map', 'feR', 'sync-configuration', 'source $MYVIMRC', 1)
call s:spacevim_bind('map', 'fev', 'display-vim-version', 'version', 1)
" }}}

" }}}

" git/versions-control {{{
let g:lmap.g = { 'name': '+git/version-control' }
call s:spacevim_bind('map', 'gb', 'git-blame', 'Gina blame', 1)
call s:spacevim_bind('map', 'gc', 'git-commit', 'Gina commit', 1)
call s:spacevim_bind('map', 'gC', 'git-checkout', 'Gina checkout', 1)
call s:spacevim_bind('map', 'gd', 'git-diff', 'Gina diff', 1)
call s:spacevim_bind('map', 'gD', 'git-diff-head', 'Gina diff HEAD', 1)
call s:spacevim_bind('map', 'gf', 'git-fetch', 'Gina fetch', 1)
call s:spacevim_bind('map', 'gF', 'git-pull', 'Gina pull', 1)
call s:spacevim_bind('map', 'gi', 'git-init', 'Gina init', 1)
call s:spacevim_bind('map', 'gI', 'git-ignore', 'ProjectRootExe edit .gitignore', 1)
call s:spacevim_bind('map', 'gl', 'git-log', 'Gina log', 1)
call s:spacevim_bind('map', 'gs', 'git-status', 'Gina status', 1)
call s:spacevim_bind('map', 'gS', 'git-stage-file', 'call feedkeys(":Gina add -- ")', 1)
call s:spacevim_bind('map', 'gP', 'git-push', 'Gina push', 1)
" }}}
"
let g:lmap.h = { 'name': '+help' }
" help {{{
call s:spacevim_bind('map', 'hm', '+help/mappings', 'Denite unite:mapping', 1)
" }}}

let g:lmap.n = { 'name': '+narrow' }
call s:spacevim_bind('map', 'nr', '+narrow/region', 'NR', 1)
call s:spacevim_bind('map', 'nR', '+narrow/region-here', 'NR!', 1)
call s:spacevim_bind('map', 'nv', '+narrow/visual', 'NRV', 1)
call s:spacevim_bind('map', 'nV', '+narrow/visual-here', 'NRV!', 1)


" projects {{{
let g:lmap.p = { 'name': '+projects' }
call s:spacevim_bind('map', 'pf', 'project-find-file', 'Denite file/rec/git', 1)
call s:spacevim_bind('map', 'pD', 'project-directory', 'ProjectRootExe VimFiler', 1)
call s:spacevim_bind('map', 'pI', 'project-invalidate-cache', 'call feedkeys(":DeniteProjectDir\<CR>\<C-l>\<Esc>")', 1)
" }}}
"
" Plugins {{{
let g:lmap.P = {'name': '+Plugins'}

function! DeinCleanup()
    call map(dein#check_clean(), "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endfunction

call s:spacevim_bind('map', 'PC', 'cleanup', 'call DeinCleanup()', 1)
call s:spacevim_bind('map', 'Pu', 'update', 'call dein#update()', 1)
call s:spacevim_bind('nmap', 'PR', 'recache-rtp', 'call dein#recache_runtimepath()', 1)
" }}}

" quit {{{
let g:lmap.q = { 'name': '+quit' }
call s:spacevim_bind('map', 'qq', 'prompt-kill-vim', 'quitall', 1)
call s:spacevim_bind('map', 'qQ', 'kill-vim', 'quitall!', 1)
call s:spacevim_bind('map', 'qs', 'save-buffers-kill-vim', 'xall', 1)
" }}}

" search/symbol {{{
let g:lmap.s = { 'name': '+search/symbol' }
call s:spacevim_bind('map', 'sc', 'highlight-persist-remove-all', 'noh', 1)
call s:spacevim_bind('nmap', 'so', 'denite-outline', 'Denite -source-names="hide" unite:outline', 1)
call s:spacevim_bind('map', 'sr', 'denite-resume', 'Denite -resume -refresh', 1)
call s:spacevim_bind('map', 'sO', 'unite-outline', 'Unite outline', 1)
call s:spacevim_bind('map', 'sp', 'smart-search', 'DeniteBufferDir grep', 1)
call s:spacevim_bind('nmap', 'sl', 'search-line', 'Denite line', 1)
call s:spacevim_bind('nmap', 'sR', 'replace-with-far', 'Farp', 1)
" }}}

" toggles {{{
let g:lmap.t = { 'name': '+toggles' }
call s:spacevim_bind('map', 'tn', 'line-numbers', 'setlocal invnumber', 1)
call s:spacevim_bind('map', 'tS', 'spelling', 'setlocal invspell', 1)

" toggles/highlight {{{
let g:lmap.t.h = { 'name': '+toggles/highlight' }
call s:spacevim_bind('nmap', 'thc', 'highlight-indentation-current-column', 'setlocal invcursorcolumn', 1)
call s:spacevim_bind('nmap', 'thl', 'highlight-current-line-globaly', 'setlocal invcursorline', 1)
" }}}
"
let g:lmap.t.C = { 'name': '+toggles/colors' }
call s:spacevim_bind('nmap', 'tCp', 'parenthesis-highlight-mode', 'setlocal invshowmatch', 1)

" }}}

" UI toggles/themes {{{
let g:lmap.T = { 'name': '+UI toggles/themes' }
call s:spacevim_bind('map', 'Td', 'version-control-margin', 'SignifyToggle', 1)
" }}}

" windows {{{
let g:lmap.w = { 'name': '+windows' }
call s:spacevim_bind('map', 'w-', 'split-window-below', 'split', 1)
call s:spacevim_bind('map', 'w/', 'split-window-right', 'vsplit', 1)
call s:spacevim_bind('map', 'w=', 'balance-windows', 'wincmd =', 1)
call s:spacevim_bind('map', 'wd', 'delete-window', 'q', 1)
call s:spacevim_bind('map', 'wh', 'window-left', 'wincmd h', 1)
call s:spacevim_bind('map', 'wH', 'window-move-far-left', 'wincmd H', 1)
call s:spacevim_bind('map', 'wj', 'window-down', 'wincmd j', 1)
call s:spacevim_bind('map', 'wJ', 'window-move-far-down', 'wincmd J', 1)
call s:spacevim_bind('map', 'wk', 'window-up', 'wincmd k', 1)
call s:spacevim_bind('map', 'wK', 'window-move-far-up', 'wincmd K', 1)
call s:spacevim_bind('map', 'wl', 'window-right', 'wincmd l', 1)
call s:spacevim_bind('map', 'wL', 'window-move-far-right', 'wincmd L', 1)
call s:spacevim_bind('map', 'wm', 'maximize-buffer', 'wincmd o', 1)
call s:spacevim_bind('map', 'ws', 'split-window-below', 'split', 1)
call s:spacevim_bind('map', 'wS', 'split-window-below-and-focus', 'split\|wincmd w', 1)
call s:spacevim_bind('map', 'wv', 'split-window-right', 'vsplit', 1)
call s:spacevim_bind('map', 'wV', 'split-window-right-and-focus', 'vsplit\|wincmd w', 1)
call s:spacevim_bind('map', 'ww', 'other-window', 'wincmd w', 1)
" }}}


" vim-leader-guide {{{
function! s:spacevim_displayfunc()
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<SID>', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '#', '', '')
endfunction
if exists('g:leaderGuide_displayfunc')
  call add(g:leaderGuide_displayfunc, function('s:spacevim_displayfunc'))
else
  let g:leaderGuide_displayfunc = [function('s:spacevim_displayfunc')]
endif

call leaderGuide#register_prefix_descriptions('<Space>', 'g:lmap')
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
map <leader>. <Plug>leaderguide-global
