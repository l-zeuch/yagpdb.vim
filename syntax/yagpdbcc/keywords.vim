" Vim syntax file
" Add-on file, containing control flow keywords and operators.

" Copyright (C) 2022    Lucas Ritzdorf, Luca Zeuch

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

" Language: YAGPDB Custom Commands
" Maintainer: Luca Zeuch <l-zeuch@email.de>,
"   LRitzdorf <42657792+LRitzdorf@users.noreply.github.com>

syn keyword yagCond             if else with try catch        contained
syn keyword yagBool             true false                    contained
syn keyword yagRepeat           range while                   contained
syn keyword yagLabel            define template block         contained
syn keyword yagKeyword          nil end                       contained
syn keyword yagStatement        return break continue         contained
syn match   yagOperator         "\v\:\="                      contained
syn match   yagOperator         "\v\="                        contained

hi def link yagCond             Conditional
hi def link yagBool             Boolean
hi def link yagRepeat           Repeat
hi def link yagLabel            Label
hi def link yagKeyword          Keyword
hi def link yagStatement        Statement
hi def link yagOperator         Operator

