func! Get_Start()
    if &filetype == 'java'
        exec "!mkdir lib && cp /usr/share/openjfx/lib/* ./lib"
    endif
endfunc
func! Compileforspecial()
    exec 'w'
    if &filetype == 'cpp'
        "exec "w"
        "exec "!g++ % -o %< -lncurses"
        exec "terminal g++ % -o %< -lncurses && ./%<"
        exec "set nonumber"
    elseif (&filetype == 'html' || &filetype == 'xhtml')
        exec "!google-chrome-stable % &"
    elseif &filetype == 'java'
        exec "vs"
        exec "terminal javac --module-path /usr/share/openjfx/lib/ --add-modules javafx.controls % && java --module-path /usr/share/openjfx/lib/ --add-modules javafx.controls %<"
    endif
endfunc

map <C-n> :call Get_Start()<CR>
map <F6> :call Compileforspecial()<CR>
