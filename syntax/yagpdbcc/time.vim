" Vim syntax file
" Add-on file, containing time keywords
" Language: YAGPDB Custom Commands
" Maintainer: Luca Zeuch <l-zeuch@email.de>,
"   LRitzdorf <42657792+LRitzdorf@users.noreply.github.com>

" Time functions, defined by <https://docs.yagpdb.xyz/reference/templates#time>
    " Time functions
syntax keyword yagpdbccTime newDate currentTime
syntax keyword yagpdbccTime formatTime
syntax keyword yagpdbccTime humanizeDurationHours  " others?
    " Finalization
highlight yagpdbccTime ctermfg=172 guifg=#d78700
