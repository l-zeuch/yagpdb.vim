" Vim filetype plugin

" Copyright (C) 2026   Luca Zeuch

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

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

let s_cpo_save = &cpoptions
set cpoptions&vim

" ydef files are tab-sensitive; do not expand tabs.
setlocal noexpandtab
