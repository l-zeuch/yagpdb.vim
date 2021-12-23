" Vim syntax file
" Primary syntax configuration file

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
if exists("b:current_syntax")
    finish
endif

" For category information, see :h group-name


" Error
syntax match yagpdbccError "\v>\$\w*" contained
    " Dollar signs directly after end-of-words, like if$myvar.
syntax region yagpdbccNestedBraces start=#\v\{\{# end=#\v\}\}# contained
    " This region only matches inside of the Expr region, ensuring we don't
    " interfere with other groups, or get false matches on things like
    " {{"{{"}}.
highlight default link yagpdbccError Error
highlight default link yagpdbccNestedBraces Error

" Expression
syntax region yagpdbccExpr start=#\v\{\{#ms=e+1 end=#\v\}\}#me=s-1
            \ contains=ALLBUT,yagpdbccComment,yagpdbccEscaped,yagpdbccFormat,
            \ yagpdbccTodo
    " Normal template expressions - where the real code is

" Comment
syntax region yagpdbccComment
            \ start=#\v\{\{%(- +)?/\*# end=#\v\*/%( +-)?\}\}#
            \ contains=@Spell,yagpdbccTodo fold
    " Inline comments, like {{ print "Hello" /*asdf*/ }}, aren't handled,
    " although I don't think they're implemented yet in Yag either.
highlight default link yagpdbccComment Comment

" Constants: String, Character, Number, Boolean, Float
" String
syntax region yagpdbccString start=#\v"# skip=#\v\\.# end=#\v"|$#
            \ contains=yagpdbccEscaped,yagpdbccFormat,@Spell contained
    " We stop strings at EOL. The Error category will match there as well, to
    " draw further attention to the issue.
syntax region yagpdbccString start=#\v`# end=#\v`#
            \ contains=yagpdbccFormat,@Spell fold contained
    " Does *not* contain `yagpdbccEscaped`, since escapes aren't valid in
    " backtick blocks.
highlight default link yagpdbccString String
syntax match yagpdbccCharacterError "\v'.{-}'" contained
	" work like a catch-all match -- if a valid match is found below,
	" that match will take precedence.
highlight default link yagpdbccCharacterError Error
syntax match yagpdbccCharacter "\v'%([^\\]|\\[abefnrtv\\'])'" contained
	" Single Character constants - no need for @Spell, newlines are not allowed.
highlight default link yagpdbccCharacter Character
" Number
syntax match yagpdbccNumber "\v[+-]?\d+%([eE]\d+)?i?" contained
syntax match yagpdbccNumber "\v[+-]?0x[\dA-Fa-f]+" contained
highlight default link yagpdbccNumber Number
" Float
syntax match yagpdbccFloat "\v[+-]?\d+\.\d+%([eE]\d+)?i?" contained
highlight default link yagpdbccFloat Float
" Boolean
syntax keyword yagpdbccBoolean true false contained
highlight default link yagpdbccBoolean Boolean

" Identifier: Function (functions include methods of classes)
syntax match yagpdbccIdentifier "\v>@!\$[A-Za-z0-9_]*" contained
    " Match any variable
highlight default link yagpdbccIdentifier Identifier

" Statement: Conditional, Repeat, Label, Operator, Keyword, Exception
" Keywords, as per <https://pkg.go.dev/text/template#hdr-Actions>
syntax keyword yagpdbccConditional if else contained
syntax keyword yagpdbccRepeat range with contained
syntax keyword yagpdbccLabel define template block contained
syntax keyword yagpdbccFunction not and or ne eq lt le gt ge contained
syntax keyword yagpdbccFunction add sub mult div fdiv log mod pow sqrt contained
syntax match yagpdbccOperator "\v\:\=" contained
syntax match yagpdbccOperator "\v\=" contained
syntax keyword yagpdbccKeyword nil end contained
highlight default link yagpdbccConditional Conditional
highlight default link yagpdbccRepeat Repeat
highlight default link yagpdbccLabel Label
highlight default link yagpdbccFunction Function
highlight default link yagpdbccOperator Operator
highlight default link yagpdbccKeyword Keyword

" Type
syntax match yagpdbccDot "\v%(\{\{|\s)\."ms=e contained
    " Order is key here. If you do the dot later, it takes priority over the
    " generic field and top-level object syntaxes, breaking them.
syntax match yagpdbccObject "\v%(>|[\$\)])@<!\.[[:alnum:]\_]+" contained
    " Regex Explanation:
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
highlight default link yagpdbccDot Type
highlight default link yagpdbccObject Type

" Special
syntax match yagpdbccEscaped "\v\\[nt\"\\]" contained
highlight default link yagpdbccEscaped Special
syntax match yagpdbccFormat "\v\%\d?[dfsu\%]" contained
    " This is *mostly* accurate, for now. Should probably be improved later.
highlight default link yagpdbccFormat Special

" Todo
syntax match yagpdbccTodo "\v<%(TODO|FIXME|HACK|XXX)>" contained
highlight default link yagpdbccTodo Todo


let b:current_syntax = "yagpdbcc"
