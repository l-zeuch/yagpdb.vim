" Script to determine text folding.

" Copyright (C) 2021    Lucas Ritzdorf

" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.

" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

setlocal commentstring="{{/* %s */}}"

setlocal foldmethod=indent
setlocal nofoldenable
    " Don't fold on startup, but leave enabled
setlocal foldignore=
    " The empty right side is correct here
" For full folding support via `expr` mode, see
" <https://learnvimscriptthehardway.stevelosh.com/chapters/49.html>
