setlocal commentstring="{{/* %s */}}"

setlocal foldmethod=indent
setlocal nofoldenable
    " Don't fold on startup, but leave enabled
setlocal foldignore=
    " The empty right side is correct here
" For full folding support via `expr` mode, see
" <https://learnvimscriptthehardway.stevelosh.com/chapters/49.html>
