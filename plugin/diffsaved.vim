function! s:DiffWithSaved()
  let filetype=&filetype
  diffthis
  vnew | read # | normal! ggdd
  diffthis
  execute "setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile readonly filetype=" . filetype
endfunction
command! DiffSaved call s:DiffWithSaved()
