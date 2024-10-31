" yagpdb.vim: Vim syntax file for yagpdb custom commands.

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
" Maintainer: Luca Zeuch <l-zeuch@email.de>,
"   LRitzdorf <42657792+LRitzdorf@users.noreply.github.com>

" Quit when a (custom) syntax file was already loaded
if exists('b:current_syntax')
    finish
endif
let b:current_syntax = 'yagpdbcc'

" Be case sensitive
syn case match

" Define the region of the template expressions, where the real code is.
syn region      yagExpr             start=#\v\{\{#ms=e+1 end=#\}\}#me=s-1
    \ contains=ALLBUT,yagComment,yagEscape,yagFormat,yagTodo keepend


" Identifiers, i.e. $my_var, $myVar ($my-var is now allowed though).
syn match       yagIdentifier       contained "\v>@!\$[A-Za-z0-9_]*"
hi def link     yagIdentifier       Identifier


" Errors
syn match       yagCharError        contained "\v'.{-}'"
syn match       yagError            contained "\v>\$\w*"
syn region      yagNestedBrace      contained start=#\v\{\{# end=#\v\}\}# extend

hi def link     yagCharError        yagError
hi def link     yagNestedBrace      yagError
hi def link     yagError            Error


" Escapes
syn match       yagChar             contained "\v'%([^\\]|\\[abefnrtv\\'])'"
syn match       yagEscape           contained "\v\\[nt\"\\]"
syn match       yagFormat           contained "\v\%\d?[dfsu\%]"

hi def link     yagChar             Character
hi def link     yagEscape           Special
hi def link     yagFormat           Special


" Strings
syn cluster     yagStringGroup      contains=yagEscape,yagFormat
syn region      yagString           contained start=+"+
                                  \ skip=+\\\\\|\\"+ end=+"\|$+
                                  \ contains=@yagStringGroup,@Spell
syn region      yagRawStr           contained start=#\v`# end=#\v`#
                                  \ contains=yagFormat,@Spell fold extend

hi def link     yagRawStr           yagString
hi def link     yagString           String


" Numbers
syn match       yagIntImg           contained "\v[+-]?\d+%([Ee]\d+)?i?"
syn match       yagHex              contained "\v[+-]?0[xX][\dA-Fa-f]+"
syn match       yagFloatImg         contained "\v[+-]?\d+\.\d*%([Ee]\d+)?i?"

hi def link     yagIntImg           yagNumber
hi def link     yagHex              yagNumber
hi def link     yagFloatImg         yagNumber
hi def link     yagNumber           Number


" Comments; their content
syn keyword     yagTodo             contained TODO FIXME XXX BUG HACK
syn cluster     yagCommentGroup     contains=yagTodo

" In-line comments (i.e. {{ print "hello" /* prints hello */ }})
" aren't handled, because they are not supported in Go's text/template anyway.
syn region      yagComment          start=#\v\{\{%(- +)?/\*#
                                  \ end=#\v\*/%( +-)?\}\}#
                                  \ contains=@yagCommentGroup,@Spell fold

hi def link     yagComment          Comment
hi def link     yagTodo             Todo


" Type
" Order is key here. If we do this later, it takes precedence over the generic
" field and top-level object syntaxes, breaking them.
syn match       yagDot              contained "\v%(\{\{|\s)\."ms=e

" - [\$\)]@<!  Negative lookbehind for the character class given (literal
"   dollar sign or closing parenthesis). Any expression that directly
"   follows these, even if it starts with a dot, is not a top-level
"   object.
" - >@<!  Negative lookbehind for the right edge of a word (i.e.
"   end-of-word). Any expression directly following one of these is a
"   second-level (or deeper) field of an object, which we don't highlight.
" - \.[[:alnum:]\_]+  Normal match expression, searching for a dot
"   followed by one or more alphanumeric characters or an underscore. This
"   is the actual text of the object -- e.g. `.User` (an object provided
"   by the YAGPDB custom command system).
syn match       yagObject           contained "\v%(>|[\$\)])@<!\.[[:alnum:]\_]+"

hi def link     yagDot              yagType
hi def link     yagObject           yagType
hi def link     yagType             Type
