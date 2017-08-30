if exists('g:GuiLoaded')
    if has('macunix')
        Guifont FuraCode Nerd Font:h13
    else
        Guifont! Fira Mono for Powerline
    endif
    call GuiWindowMaximized(1)
endif
