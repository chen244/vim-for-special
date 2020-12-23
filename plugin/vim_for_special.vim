func! Get_Start()
    if &filetype == 'java'
        exec "!mkdir lib && cp /usr/share/openjfx/lib/* ./lib"
    endif
endfunc
func! Get_location()
    let m = bufname('%') 
    let location=strlen(m)
    let i=0
    while i<strlen(m)
        if(m[i]=='.')
            let location=i
        endif
        let i+=1
    endwhile
    let m=m[:location-1]
    let i=0
    let j=0
    while i<strlen(m)
       if(m[i]=='/')
           let j+=1
       endif
       let i+=1
    endwhile
    let i=0
    while i<j
        let m = substitute(m, '/', '.', " ")
        let i+=1
    endwhile
    return m
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
        let now = Get_location()
        exec "vs"
        "exec "terminal javac --module-path /usr/share/openjfx/lib/ --add-modules javafx.controls % && java --module-path /usr/share/openjfx/lib/ --add-modules javafx.controls %<"
        exec "terminal javac --module-path /usr/share/openjfx/lib/ --add-modules javafx.controls % && java --module-path /usr/share/openjfx/lib/ --add-modules javafx.controls " . now
    endif
endfunc

map <C-n> :call Get_Start()<CR>
map <F6> :call Compileforspecial()<CR>
