" Vim indent file

" Copyright (C) 2021    Lucas Ritzdorf, Luca Zeuch

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
" Maintainer: Luca Zeuch <l-zeuch@email.de>

" This indent script is based on
" https://github.com/fatih/vim-go/blob/master/indent/gohtmltmpl.vim, as that is
" what YAGPDB custom commands in essence are.

if exists('b:did_indent')
    finish
endif

" YAGPDB Custom Commands use the Go text/template package, which in turn is just
" fancy HTML templates. This works quite well.
runtime! indent/html.vim

" No suitable inbuilt solution, so we'll have to tell Vim what to actually do.
setlocal indentexpr=GetYagIndent(v:lnum)
setlocal indentkeys+==else,=end

" Only define indent function once.
if exists('*GetYagIndent')
    finish
endif

" Don't spam the user in Vi compat
let s:cpo_save = &cpoptions
set cpoptions&vim

" Though functions should usually go into autoload/, this one is an exception.
function! GetYagIndent(lnum) abort

    let l:indent = 0

    if exists('*HtmlIndent')
        let l:indent = HtmlIndent()
    else
        let l:indent = HtmlIndentGet(a:lnum)
    endif

    " These keywords indent the next lines.
    let l:last_line = getline(a:lnum-1)
    if l:last_line =~# '^\s*{{-\=\s*\%(if\|else\|with\|try\|range\|while\|define\|template\|block\).*}}'
        let l:indent += shiftwidth()
    endif

    " These keywords need to be outdented once, so that they start in the same
    " column as their indenting counterpart.
    let l:current_line = getline(a:lnum)
    if l:current_line =~# '^\s*{{-\=\s*\%(else\|catch\|end\).*}}'
        let l:indent -= shiftwidth()
    endif

    return l:indent
endfunction

" Restore Vi compat
let &cpoptions = s:cpo_save
unlet s:cpo_save
