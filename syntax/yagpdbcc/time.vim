" Vim syntax file
" Add-on file, containing time keywords
" Language: YAGPDB Custom Commands
" Maintainer: Luca Zeuch <l-zeuch@email.de>,
"   LRitzdorf <42657792+LRitzdorf@users.noreply.github.com>

" Time functions, defined by <https://docs.yagpdb.xyz/reference/templates#time>
    " Time functions
syntax keyword yagpdbccFunction newDate currentTime
syntax keyword yagpdbccFunction formatTime
syntax keyword yagpdbccFunction humanizeDurationHours  " others?
    " Finalization
highlight yagpdbccTime ctermfg=58 guifg=#5f5f00
