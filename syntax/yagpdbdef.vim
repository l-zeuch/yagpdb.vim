" yagpdb.vim: Vim syntax file for yagpdb custom commands.

" Copyright (C) 2026    Luca Zeuch

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

" Language: YAGPDB Custom Commands - Function Definitions
" Maintainer: Luca Zeuch <l-zeuch@email.de>,
"   LRitzdorf <42657792+LRitzdorf@users.noreply.github.com>

if exists('b:current_syntax')
    finish
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

unlet! b:current_syntax
syntax include @Yagpdbcc syntax/yagpdbcc.vim

let b:current_syntax = 'yagpdbdef'

syn case match


" Markdown helper
syn cluster   ydefInlineMarkdown   contains=markdownBold,
                                          \ markdownItalic,
                                          \ markdownCode,
                                          \ markdownLink,
                                          \ markdownUrl

" Function definitions
syn keyword   ydefDeclaration      func
syn match     ydefParameter        "\v\w="
syn match     ydefOperator         "\v\?|\.\.\."

hi def link   ydefDeclaration      Keyword
hi def link   ydefParameter        Identifier
hi def link   ydefOperator         Operator

syn keyword    ydefTodo             contained TODO FIXME XXX BUG HACK
hi def link    ydefTodo             Todo

" Function documentation
syn region     ydefDocstring        start="\v^\t" end="$" extend
                                  \ contains=@Spell,@ydefInlineMarkdown,
                                           \ @ydefCommentGroup
syn region     ydefCodeblock        matchgroup=markdownCodeDelimiter
                                  \ start="^\s*`\{3}yag\>\s*$"
                                  \ end="^\s*`\{3}\s*$" keepend
                                  \ contains=@Yagpdbcc containedin=ydefDocstring

" Comments
syn cluster    ydefCommentGroup     contains=ydefTodo
syn region     ydefComment          start="^==" end="$"
                                  \ contains=@ydefCommentGroup,@Spell
hi def link    ydefComment          Comment


let &cpoptions = s:cpo_save
unlet s:cpo_save
