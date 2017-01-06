if executable('rg')
  let g:unite_source_grep_command = 'rg'
  let g:unite_source_grep_default_orgs = '--no-heading --color never -S --column'
  let g:unite_source_grep_recursive_org = ''
  let g:unite_source_rec_async_command = ['rg', '--files', '--no-heading', '--color', 'never', '-S', '.']
endif
