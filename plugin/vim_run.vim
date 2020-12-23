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
        exec "set nonumber"
    endif
endfunc
func! Compileforopencv()
    if &filetype == 'cpp'
        exec 'vsplit'
        exec 'terminal g++ % -o %< `pkg-config --cflags --libs opencv` && ./%<'
        exec "set nonumber"
    endif
endfunc
func! CompileRunGcc()

        exec "w"

    if &filetype == 'c'
    
        exec "!g++ % -o %<"
        exec "vsplit"
        exec "terminal ./%<"
        exec "set nonumber"
        "exec "!time ./%<"
    
    elseif &filetype == 'cpp'
        "exec "!g++ % -o %<" 
        "exec "!g++ % -o %< `pkg-config --cflags --libs opencv`"
        "exec "!g++ % -o %< -lncurses"
        exec "vsplit"
        exec "terminal g++ % -o %< && ./%<"
        exec "set nonumber"
    elseif &filetype == 'cs'
        
        "exec "!mcs %"
        exec "vsplit"
        exec "terminal mcs % && mono ./%<.exe"
        exec "set nonumber"

        "exec "!mono ./%<.exe"
    elseif &filetype == 'java'
    
        let now = Get_location()
        "exec "!javac %"
        exec "vsplit"
        exec "terminal javac % && java " . now
        exec "set nonumber"

        "exec "!time java %<"
    
    elseif &filetype == 'sh'
    
        exec ":!time bash %"
    
    elseif &filetype == 'python'
    
        exec "vs %"
        exec "terminal python %"
        exec "set nonumber"
        "exec "vs %"
    
    elseif &filetype == 'javascript'
        exec "vs"
        exec "terminal node  %"
        exec "set nonumber"
    
    elseif (&filetype == 'html' || &filetype == 'xhtml')
        exec "vs"
        exec "terminal elinks %"
        exec "set nonumber"
        "exec "!google-chrome-stable % &"
    
    elseif &filetype == 'go'
    
        "exec "!go build %"
        exec "vsplit"
        exec "terminal go build % && ./%<"
        "exec "terminal go run %"
        exec "set nonumber"

        "exec "!time /usr/local/go/bin/go run %"
    
    elseif &filetype == 'markdown'
    
        exec "!google-chrome-stable %"
    
    elseif &filetype == 'tex'
            exec "!xelatex %"
            "exec "!pdflatex -synctex=1 -interaction=nonstopmode %"
            exec "!pkill evince"
            exec "!evince %:r.pdf &"
    elseif &filetype == 'lua'
    
            exec "!time lua %"
    
    elseif &filetype == 'perl'
    
            exec "!time perl %"
    elseif &filetype == 'dart'
    
            exec "!time dart %"
    elseif &filetype == 'rust'
        exec "vs"    
        exec "terminal cargo build && cargo run"
        "exec "terminal cargo run"
    elseif &filetype == 'julia'
            exec "!julia %"
    elseif &filetype == 'vim'
            exec "source %"
    elseif &filetype == 'nroff'
        exec "vs"
        exec "terminal man ./%"
        exec "set nonumber"
    elseif &filetype == 'php'
        exec "vs"
        exec "set nonumber"
        exec "terminal php %"
    elseif &filetype == 'ruby'
        exec "vs"
        exec "set nonumber"
        exec "terminal ruby %"
    elseif &filetype == 'kotlin'
        exec "vs"
        exec "set nonumber"
        exec "terminal kotlinc % -include-runtime -d %<.jar && java -jar %<.jar"
    endif
endfunc

func! DebugGO()
    exec "w"
    if &filetype == 'go'
        exec "vsplit"
        exec "terminal go run %"
        exec "set nonumber"
    elseif &filetype == 'html'
        exec "vs"
        "exec "terminal w3m 127.0.0.1/%"
        exec "terminal elinks 127.0.0.1/%"
        exec "set nonumber"
    elseif &filetype == 'xhtml'
        exec "vs"
        "exec "terminal w3m 127.0.0.1/%"
        exec "terminal elinks 127.0.0.1/%"
        exec "set nonumber"

    elseif &filetype == 'php'
        exec "vs"
        "exec "terminal w3m 127.0.0.1/%"
        exec "terminal elinks 127.0.0.1/%"
        exec "set nonumber"
    elseif &filetype == 'java'    
        exec "vsplit"
        exec "terminal javac %"
        exec "set nonumber"
    endif
endfunc

map <F7> :call DebugGO()<CR>
map <C-n> :call Get_Start()<CR>
map <C-k> :call Compileforopencv()<CR>
map <F6> :call Compileforspecial()<CR>
map <F5> :call CompileRunGcc()<CR>
