" Autoloading file for the main plugin things.

" Copyright (C) 2022    Lucas Ritzdorf, Luca Zeuch

" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.

" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

" Don't spam the user when Vim is started in Vi compat
let s:cpo_save = &cpoptions
set cpoptions&vim

" Quick function and command to copy the whole file to the system clipboard
function! yagpdbcc#Copy() abort
    if has('clipboard')
        if yagpdbcc#config#UsePrimary() != 0
            execute '%y *'
            " Fancy regex to remove the trailing newline that Vim copies
            let @*=substitute(@*,'\n$','','')
        else
            execute '%y +'
            let @+=substitute(@+,'\n$','','')
        endif
    else
        echohl Error
        echo "Your Vim doesn't appear to have clipboard support."
        echohl None
    endif
endfunction

" Make jumping between sections work nicely
function! yagpdbcc#NextSection(type, backwards, visual) abort
    if a:visual
        normal! gv
    endif

    if a:type == 1
        let l:pattern = '\v%(\n\n^\S|%^)'
        let l:flags = 'e'
    elseif a:type == 2
        let l:pattern = '\v%(\n\n^\S|%$)'
        let l:flags = ''
    endif

    if a:backwards
        let l:dir = '?'
    else
        let l:dir = '/'
    endif

    execute 'silent normal! ' . l:dir . l:pattern . l:dir . l:flags . '\r'
endfunction

function! yagpdbcc#PathSep() abort
    if has('win32')
        return '\'
    endif

    return '/'
endfunction

" Restore Vi compat
let &cpoptions = s:cpo_save
