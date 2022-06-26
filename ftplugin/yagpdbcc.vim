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

if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpoptions
set cpoptions&vim

" Automatically insert closing double braces
inoremap         {{  {{}}<left><left>
inoremap <expr>  }}  strpart(getline('.'), col('.')-1, 2) == "}}" ? "\<right>\<right>" : "}}"

" Jump between sections
noremap  <script> <buffer> <silent> ]] :call      yagpdbcc#NextSection(1, 0, 0)<cr>
noremap  <script> <buffer> <silent> [[ :call      yagpdbcc#NextSection(1, 1, 0)<cr>
noremap  <script> <buffer> <silent> ][ :call      yagpdbcc#NextSection(2, 0, 0)<cr>
noremap  <script> <buffer> <silent> [] :call      yagpdbcc#NextSection(2, 1, 0)<cr>
vnoremap <script> <buffer> <silent> ]] :<c-u>call yagpdbcc#NextSection(1, 0, 1)<cr>
vnoremap <script> <buffer> <silent> [[ :<c-u>call yagpdbcc#NextSection(1, 1, 1)<cr>
vnoremap <script> <buffer> <silent> ][ :<c-u>call yagpdbcc#NextSection(2, 0, 1)<cr>

" Restore Vi compat
let &cpoptions = s:cpo_save
unlet s:cpo_save
