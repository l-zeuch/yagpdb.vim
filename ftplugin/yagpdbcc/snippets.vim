" File to manage loading snippets, such as a basic custom command and other
" more fancy stuff.

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

" don't spam the user when Vim is started in Vi compat
let s:cpo_save = &cpoptions
set cpoptions&vim

if exists('g:yagpdbcc_loaded_snippets')
    finish
endif
let g:yagpdcc_loaded_snippets = 1

let s:engine = yagpdbcc#config#SnippetEngine()
if s:engine is? 'ultisnips'
    call yagpdbcc#snippets#Ultisnips()
elseif s:engine is? 'neosnippet'
    call yagdbcc#snippets#Neosnippet()
endif

" Restore Vi compat
let &cpoptions = s:cpo_save
unlet s:cpo_save
