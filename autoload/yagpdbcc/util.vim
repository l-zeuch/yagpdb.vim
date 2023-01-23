" Autoloading file various utilities.

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


" yagpdbcc#PathSep returns the OSs path separator.
" For Microsoft Windows, that is \, for UNIX and UNIX-like it is /.
function! yagpdbcc#util#PathSep() abort
    if has('win32')
        return '\'
    endif

    return '/'
endfunction

" yagpbcc#util#Error takes a string argument and highlights it as error.
function! yagpdbcc#util#Error(msg) abort
    echohl ErrorMsg
        echo '[yagpdb.vim]: ' . a:msg
    echohl None
endfunction

" yagpdbcc#util#Warn takes a string argument and highlights it as warning.
function! yagpdbcc#util#Warn(msg) abort
    echohl WarningMsg
        echo '[yagpdb.vim]: ' . a:msg
    echohl None
endfunction

" Restore Vi compat
let &cpoptions = s:cpo_save
