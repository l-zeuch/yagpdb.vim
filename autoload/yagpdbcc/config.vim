" Autoloading file for various bits of config.

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

" yagpdbcc#config#OverrideFt returns the value of the global
" yagpdbcc_override_ft variable used to determine whether to override more
" filetypes.
" Its default return value is 0.
function! yagpdbcc#config#OverrideFt() abort
	return get(g:, 'yagpdbcc_override_ft')
endfunction

" yagpdbcc#config#UsePrimary returns the value of the global
" yagpdbcc_use_primary variable used to determine whether to use the * or +
" register.
" Its default return value is 0.
function! yagpdbcc#config#UsePrimary() abort
	return get(g:, 'yagpdbcc_use_primary')
endfunction

" yagpdbcc#config#SnippetEngine returns the value of the global
" yagpdbcc_snippet_engine variable used to determine what snippet engine to use.
" Its default return value is an empty string ''.
" Available snippet engines are ultisnips and neosnippet.
function! yagpdbcc#config#SnippetEngine() abort
    let l:engine = get(g:, 'yagpdbcc_snippet_engine', '')

    if l:engine isnot? '' && l:engine isnot? 'ultisnips' && l:engine isnot? 'neosnippet'
        call yagpdbcc#util#Warn(l:engine . ' is not a supported snippet engine.')
        return ''
    endif

    return l:engine
endfunction

" Restore Vi compat
let &cpoptions = s:cpo_save
