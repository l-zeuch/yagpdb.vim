" Vim syntax file
" Primary syntax configuration file
" Language: YAGPDB Custom Commands
" Maintainer: Luca Zeuch <l-zeuch@email.de>,
"   LRitzdorf <42657792+LRitzdorf@users.noreply.github.com>

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" For category information, see :h group-name


" Comment
syntax region yagpdbccComment start=#\v\{\{%(- +)?\/\*#hs=e-1 end=#\v\*\/%( +-)?\}\}#me=s+1
            \ contains=@Spell,yagpdbccTodo fold
    " Inline comments, like {{ print "Hello" /*asdf*/ }}, aren't handled,
    " although I don't think they're implemented yet in Yag either.
    " Also, this consumes the opening braces (to prevent the yagpdbccExpr
    " group from matching first), but not the closing braces (to allow the
    " yagpdbccIgnore group to match).
highlight default link yagpdbccComment Comment

" Constants: String, Character, Number, Boolean, Float
" String
syntax region yagpdbccString start=#\v"# skip=#\v\\.# end=#\v"|$# contains=yagpdbccEscaped,yagpdbccFormat,@Spell
    " We stop strings at EOL. The Error catgeory will match there as well, to
    " draw further attention to the issue.
syntax region yagpdbccString start=#\v`# end=#\v`# contains=yagpdbccFormat,@Spell fold
    " Does *not* contain `yagpdbccEscaped`, since escapes aren't valid in
    " backtick blocks.
highlight default link yagpdbccString String
" Number
syntax match yagpdbccNumber "\v[+-]?\d+%([eE]\d+)?i?"
syntax match yagpdbccNumber "\v[+-]?0x[\dA-Fa-f]+"
highlight default link yagpdbccNumber Number
" Float
syntax match yagpdbccFloat "\v[+-]?\d+\.\d+%([eE]\d+)?i?"
highlight default link yagpdbccFloat Float
" Boolean
syntax keyword yagpdbccBoolean true false
highlight default link yagpdbccBoolean Boolean

" Identifier: Function (functions include methods of classes)
syntax match yagpdbccIdentifier "\v>@!\$?[A-Za-z0-9_]*" nextgroup=yagpdbccField
    " Match any variable
highlight default link yagpdbccIdentifier Identifier

" Statement: Conditional, Repeat, Label, Operator, Keyword, Exception
" Keywords, as per <https://pkg.go.dev/text/template#hdr-Actions>
syntax keyword yagpdbccConditional if else
syntax keyword yagpdbccRepeat range with
syntax keyword yagpdbccLabel define template block
syntax keyword yagpdbccOperator not and or ne eq lt le gt ge
syntax keyword yagpdbccOperator add sub mult div fdiv log mod pow sqrt
syntax match yagpdbccOperator "\v\:\="
syntax match yagpdbccOperator "\v\="
syntax keyword yagpdbccKeyword nil end
highlight default link yagpdbccConditional Conditional
highlight default link yagpdbccRepeat Repeat
highlight default link yagpdbccLabel Label
highlight default link yagpdbccOperator Operator
highlight default link yagpdbccKeyword Keyword

" Type
syntax match yagpdbccDot "\v%(\{\{|\s)\."ms=e
    " Order is key here. If you do the dot later, it takes priority over the
    " generic field and top-level object syntaxes, breaking them.
syntax match yagpdbccObject "\v>@!\.[[:alnum:]\_]+" nextgroup=yagpdbccField
syntax match yagpdbccField "\v>\)?\zs\.[[:alnum:]\_]+" nextgroup=yagpdbccField
    " We use \zs here to start the match region, because we can't use a
    " constant offset from either end to do so.
highlight default link yagpdbccDot Type
highlight default link yagpdbccObject Type
highlight default link yagpdbccField Type

" Special
syntax match yagpdbccEscaped "\v\\[nt\"\\]" contained
highlight default link yagpdbccEscaped Special
syntax match yagpdbccFormat "\v\%\d?[dfsu\%]" contained
    " This is *mostly* accurate, for now. Should probably be improved later.
highlight default link yagpdbccFormat Special

" Ignore
syntax region yagpdbccIgnore start=#\v%^%(\{\{)@!# end=#\v\{\{#me=s-1 start=#\v\}\}#ms=e+1 end=#\v%$# contains=@Spell
highlight default link yagpdbccIgnore Normal
    " Instead of using the actual Ignore group, which is normally invisible,
    " we just link to the Normal highlight.

" Error
syntax match yagpdbccError "\v>\$\w*"
    " Dollar signs directly after end-of-words, like if$myvar.
syntax region yagpdbccExpr start=#\v\{\{#ms=e+1 end=#\v\}\}#me=s-1 contains=ALL
syntax region yagpdbccNestedBraces start=#\v\{\{# end=#\v\}\}# contained
    " This region only matches inside of the Expr region, ensuring we don't
    " interfere with other groups, or get false matches on things like
    " {{"{{"}}.
highlight default link yagpdbccError Error
highlight default link yagpdbccNestedBraces Error

" Todo
syntax match yagpdbccTodo "\v<%(TODO|FIXME|XXX)>" contained
highlight default link yagpdbccTodo Todo


let b:current_syntax = "yagpdbcc"
