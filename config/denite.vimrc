if executable('rg')
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
                \ ['--vimgrep', '--no-heading'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    call denite#custom#var('file_rec', 'command',
                \ ['rg', '--files', '--glob', '!.git'])
endif

if has('nvim')
  call denite#custom#source('file/rec', 'matchers',
        \ ['matcher/cpsm'])
endif

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>')

"File Deletion
function! s:denite_delete(context)
    let path = a:context['targets'][0].action__path
    let choice = confirm('Delete ' . path . '?', "&Yes\n&No", 2)
    if choice == 1
        call delete(path)
    endif
endfunction

call denite#custom#action('file', 'delete', function('s:denite_delete'))

