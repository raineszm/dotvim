" Load plugin specific configs

let s:plugins = glob(g:config_dir . '/config/plugins/*.vimrc', 0, 1)

for p in s:plugins
    exe 'source '. p
endfor

