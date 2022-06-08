" Main plugin file.

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

if exists('g:yagpdbcc_loaded')
	finish
endif
let g:yagpdbcc_loaded = 1

" Don't spam the user when Vim is started in Vi compat
let s:cpo_save = &cpoptions
set cpoptions&vim

" vint: -ProhibitAutocmdWithNoGroup
" Also use *.tmpl, *.gotmpl et al., which are originally only Go.
if yagpdbcc#config#OverrideFt() != 0
    " Here, we need to explicitly override the default syntax - "setfiletype"
    " will not override an existing filetype.
    au BufRead,BufNewFile *.tmpl,*.gotmpl
        \ if yagpdbcc#config#OverrideFt() | setlocal filetype=yagpdbcc | endif
endif
" vint: +ProhibitAutocmdWithNoGroup

" Load completion sources for nvim-cmp when Lua is supported.
" This will also be the place for more Lua script, if we decide to add a few
" more things that need/do Lua magic.
if has('lua')
lua << ENDLUA
	require('yagpdbcc')
ENDLUA
endif

command! YagCopy :call yagpdbcc#Copy()

" Restore Vi compat
let &cpoptions = s:cpo_save
unlet s:cpo_save
