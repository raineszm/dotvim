let g:ale_python_pylama_executable =
\   get(g:, 'ale_python_pylama_executable', 'pylama')

let g:ale_python_pylama_options =
\   get(g:, 'ale_python_pylama_options', '')

function! ale_linters#python#pylama#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'python_pylama_executable')
endfunction

function! ale_linters#python#pylama#GetCommand(buffer) abort
    return ale_linters#python#pylama#GetExecutable(a:buffer)
    \   . ' ' . ale#Var(a:buffer, 'python_pylama_options')
    \   . ' --format pep8'
    \   . ' %t'
endfunction

call ale#linter#Define('python', {
\   'name': 'pylama',
\   'executable_callback': 'ale_linters#python#pylama#GetExecutable',
\   'command_callback': 'ale_linters#python#pylama#GetCommand',
\   'callback': 'ale_linters#python#flake8#Handle',
\})
