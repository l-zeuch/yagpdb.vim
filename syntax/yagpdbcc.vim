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

if !exists('b:main_syntax')
    let b:main_syntax = 'yagpdbcc'
endif

" Include Markdown syntax to save ourselves some work
unlet! b:current_syntax
syn include @Md syntax/markdown.vim

let b:current_syntax = 'yagpdbcc'

let s:cpo_save = &cpoptions
set cpoptions&vim

runtime! syntax/yagpdbcc/functions.vim
runtime! syntax/yagpdbcc/keywords.vim


" Be case sensitive
syn case match


" Common errors
syn match       yagNestedBrace      "\v[\{\}]{2}"
syn match       yagTrailingVarError "\v>\$\w*"

hi def link     yagCharError        yagError
hi def link     yagNestedBrace      yagError
hi def link     yagTrailingVarError yagError
hi def link     yagError            Error


" Highlight non-template regions as Markdown
syn region      yagDiscordMsg       contains=@Md start=#\%^# end=#\%$#
syn region      yagDiscordMsg       contains=@Md start=#\%^# matchgroup=yagTemplate end=#\v\{\{%(- )?#
syn region      yagDiscordMsg       contains=@Md matchgroup=yagTemplate start=#\v%( -)?\}\}# matchgroup=NONE end=#\%$#
syn region      yagDiscordMsg       contains=@Md matchgroup=yagTemplate start=#\v%( -)?\}\}# end=#\v\{\{%(- )?#
" If we get `syn include`d, our `\%^` pattern above will fail to match, because
" we won't be at the start of the entire file, and the nested-braces error
" highlight will apply instead.
" To work around this, match the open-template marker at the start of any line.
" This incorrectly hides the nested-braces error if the erroneous brace is at
" the start of a line, but that's probably acceptable.
syn match       yagTemplate         "\v^\{\{%(- )?"

hi def link     yagTemplate         Macro


" Identifiers, i.e. $my_var, $myVar ($my-var is not allowed though).
syn match       yagIdentifier       "\v>@!\$[A-Za-z0-9_]*"

hi def link     yagIdentifier       Identifier


" Escapes
syn match       yagChar             "\v'%([^\\]|\\[abefnrtv\\'])'"
syn match       yagEscape           "\v\\[nt\"\\]"
syn match       yagFormat           "\v\%\d?[dfsu\%]"

hi def link     yagChar             Character
hi def link     yagEscape           Special
hi def link     yagFormat           Special


" Strings
syn cluster     yagStringGroup      contains=yagEscape,yagFormat
syn region      yagString           start=+"+ skip=+\\\\\|\\"+ end=+"\|$+
                                  \ contains=@yagStringGroup,@Spell
syn region      yagRawStr           start=#\v`# end=#\v`#
                                  \ contains=yagFormat,@Spell fold extend

hi def link     yagRawStr           String
hi def link     yagString           String


" Numbers
syn match       yagIntImg           "\v[+-]?\d+%([Ee]\d+)?i?"
syn match       yagHex              "\v[+-]?0[xX][\dA-Fa-f]+"
syn match       yagFloatImg         "\v[+-]?\d+\.\d*%([Ee]\d+)?i?"

hi def link     yagIntImg           yagNumber
hi def link     yagHex              yagNumber
hi def link     yagFloatImg         yagNumber
hi def link     yagNumber           Number


" Comments
syn keyword     yagTodo             contained TODO FIXME XXX BUG HACK
syn cluster     yagCommentGroup     contains=yagTodo

" In-line comments (i.e. {{ print "hello" /* prints hello */ }})
" aren't supported in Go's text/template system, but we can't easily flag them
" as errors...
syn region      yagComment          start=#\/\*# end=#\*\/#
                                  \ contains=@yagCommentGroup,@Spell fold

hi def link     yagTodo             Todo
hi def link     yagComment          Comment


" Type
" Order is key here. If we do this later, it takes precedence over the generic
" field and top-level object syntaxes, breaking them.
syn match       yagDot              "\v%(\{\{|\s)\."ms=e

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
syn match       yagObject           "\v%(>|[\$\)])@<!\.[[:alnum:]\_]+"

hi def link     yagDot              yagType
hi def link     yagObject           yagType
hi def link     yagType             Type


let &cpoptions = s:cpo_save
unlet s:cpo_save
