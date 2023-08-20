" File used to detect the filetype of extensions used for YAGPDB Custom
" Commands.

" Copyright (C) 2021    Lucas Ritzdorf, Luca Zeuch

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

" vint: -ProhibitAutocmdWithNoGroup
" should not use augroups in ftdetect, see :help ftdetect
"
" [...] there is no "augroup" command, this has already been done when
" sourcing your file. You could also use the pattern "*" and then check the
" contents of the file to recognize it.

" Detect our 'own' extensions, which are usually used by a
" vast majority of the userbase.
au BufRead,BufNewFile   *.yag         setfiletype yagpdbcc
au BufRead,BufNewFile   *.yagcc       setfiletype yagpdbcc

" Also use *.tmpl, *.gotmpl et al., which are originally only Go, if configured.
" Here, we need to explicitly override the default syntax - "setfiletype"
" will not override an existing filetype.
au BufRead,BufNewFile   *.tmpl,*.gotmpl
    \ if yagpdbcc#config#OverrideFt() | setlocal filetype=yagpdbcc | endif

" Restore Vi compat
let &cpoptions = s:cpo_save
unlet s:cpo_save
