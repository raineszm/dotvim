if isdirectory(expand('$HOME/anaconda3/'))
    let g:python3_host_prog = expand('$HOME/anaconda3/bin/python')
endif

if exists('g:GuiLoaded')
    if has('macunix')
        Guifont FuraCode Nerd Font:h13
    else
        Guifont! Fira Mono for Powerline
    endif
endif
