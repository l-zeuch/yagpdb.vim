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

function! yagpdbcc#config#OverrideFt() abort
	return get(g:, 'yagpdbcc_override_ft')
endfunction

function! yagpdbcc#config#UsePrimary() abort
	return get(g:, 'yagpdbcc_use_primary')
endfunction

function! yagpdbcc#config#SnippetEngine() abort
    return get(g:, 'yagpdbcc_snippet_engine', '')
endfunction

" Restore Vi compat
let &cpoptions = s:cpo_save
unlet s:cpo_save

