if exists('g:loaded_unite')
  finish
endif
let g:loaded_unite = 1

function! s:UniteCompat(command, args, line1, line2)
    let l:source = split(a:args)[1]
    if l:source ==# 'file_rec/async'
        let l:source = 'file_rec'
    elseif l:source ==# 'file'
        let l:source = 'file_rec'
    endif
    execute a:command . ' ' . l:source
endfunction

command! -nargs=* -range
      \ Unite
      \ call <SID>UniteCompat('Denite', <q-args>, <line1>, <line2>)

command! -nargs=* -range
      \ UniteWithProjectDir
      \ call <SID>UniteCompat('DeniteProjectDir', <q-args>, <line1>, <line2>)

function! s:AgCompat(...)
    if len(a:000) > 0
        execute 'DeniteBufferDir' 'grep:::' . a:000[0]
    else
        :DeniteBufferDir grep
    end
endfunction

command! -nargs=? Ag call <SID>AgCompat(<f-args>)
