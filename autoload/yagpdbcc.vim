" Autoloading file for the main plugin things.

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

" This file will be populated with autoload-able global plugin functions.
" Right now it is empty, because no such functions are needed yet.

" Restore Vi compat
let &cpoptions = s:cpo_save
unlet s:cpo_save
