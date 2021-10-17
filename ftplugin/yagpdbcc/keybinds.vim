" File to make certain grunt tasks (such as double braces) automatic.

" Copyright (C) 2021   Lucas Ritzdorf

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

" Automatically insert closing double braces
inoremap         {{  {{}}<left><left>
inoremap <expr>  }}  strpart(getline('.'), col('.')-1, 2) == "}}" ? "\<right>\<right>" : "}}"

" Make jumping between sections work nicely
function! s:NextSection(type, backwards, visual)
    if a:visual
        normal! gv
    endif

    if a:type == 1
        let pattern = '\v%(\n\n^\S|%^)'
        let flags = 'e'
    elseif a:type == 2
        let pattern = '\v%(\n\n^\S|%$)'
        let flags = ''
    endif

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction

noremap <script> <buffer> <silent> ]] :call <SID>NextSection(1, 0, 0)<cr>
noremap <script> <buffer> <silent> [[ :call <SID>NextSection(1, 1, 0)<cr>
noremap <script> <buffer> <silent> ][ :call <SID>NextSection(2, 0, 0)<cr>
noremap <script> <buffer> <silent> [] :call <SID>NextSection(2, 1, 0)<cr>
vnoremap <script> <buffer> <silent> ]] :<c-u>call <SID>NextSection(1, 0, 1)<cr>
vnoremap <script> <buffer> <silent> [[ :<c-u>call <SID>NextSection(1, 1, 1)<cr>
vnoremap <script> <buffer> <silent> ][ :<c-u>call <SID>NextSection(2, 0, 1)<cr>
vnoremap <script> <buffer> <silent> [] :<c-u>call <SID>NextSection(2, 1, 1)<cr>
