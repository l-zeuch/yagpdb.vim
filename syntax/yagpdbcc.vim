" Vim syntax file
" Language: YAGPDB Custom Commands
" Maintainer: Luca Zeuch <l-zeuch@email.de>,
" 	LRitzdorf <42657792+LRitzdorf@users.noreply.github.com>

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" For category information, see :h group-name


" Comment
syntax region yagpdbccComment start=#\v\{\{(- +)?\/\*#ms=e-1 end=#\v\*\/( +-)?\}\}#me=s+1
            \ contains=@Spell fold
    " Inline comments, like {{ print "Hello" /*asdf*/ }}, aren't handled,
    " although I don't think they're implemented yet in Yag either.
highlight link yagpdbccComment Comment

" Constants: String, Character, Number, Boolean, Float
" String
syntax region yagpdbccString start=#\v"# skip=#\v\\.# end=#\v"|$# contains=yagpdbccEscaped,yagpdbccFormat,@Spell
    " We stop strings at EOL. The Error catgeory will match there as well, to
    " draw further attention to the issue.
syntax region yagpdbccString start=#\v`# end=#\v`# contains=yagpdbccFormat,@Spell fold
    " Does *not* contain `yagpdbccEscaped`, since escapes aren't valid in
    " backtick blocks.
highlight link yagpdbccString String
" Number
syntax match yagpdbccNumber "\v[+-]?\d+([eE]\d+)?i?"
syntax match yagpdbccNumber "\v[+-]?0x[\dA-Fa-f]+"
highlight link yagpdbccNumber Number
" Float
syntax match yagpdbccFloat "\v[+-]?\d+\.\d+([eE]\d+)?i?"
highlight link yagpdbccFloat Float
" Boolean
syntax keyword yagpdbccBoolean true false
highlight link yagpdbccBoolean Boolean

" Identifier: Function (functions include methods of classes)
syntax match yagpdbccIdentifier "\v\$([A-Za-z][A-Za-z0-9]*)?"
    " Match any varible
highlight link yagpdbccIdentifier Identifier
" Functions, defined by <https://docs.yagpdb.xyz/reference/templates#functions>
    " Type conversion
syntax keyword yagpdbccFunction json structToSdict
syntax keyword yagpdbccFunction toByte toDuration toFloat toInt toInt64 toRune toString
syntax keyword yagpdbccFunction str
    " String manipulation
syntax keyword yagpdbccFunction joinStr lower upper slice urlescape split title
syntax keyword yagpdbccFunction reFind reFindAll reFindAllSubmatches reReplace reSplit
syntax keyword yagpdbccFunction print printf println js html
    " Math functions
syntax keyword yagpdbccFunction randInt round roundCeil roundFloor roundEven
    " Message functions
syntax keyword yagpdbccFunction addMessageReactions addReactions addResponseReactions
syntax keyword yagpdbccFunction deleteAllMessageReactions deleteMessageReaction
syntax keyword yagpdbccFunction complexMessage complexMessageEdit
syntax keyword yagpdbccFunction deleteMessage deleteResponse deleteTrigger
syntax keyword yagpdbccFunction editMessage editMessageNoEscape
syntax keyword yagpdbccFunction getMessage
syntax keyword yagpdbccFunction sendDM sendMessage sendMessageNoEscape
syntax keyword yagpdbccFunction sendMessageRetID sendMessageNoEscapeRetID
    " Channel
syntax keyword yagpdbccFunction getChannel editChannelTopic editChannelName
    " Mentions
syntax keyword yagpdbccFunction mentionEveryone mentionHere mentionRoleName mentionRoleID
    " Role functions
syntax keyword yagpdbccFunction addRoleID addRoleName removeRoleID removeRoleName
syntax keyword yagpdbccFunction giveRoleID giveRoleName takeRoleID takeRoleName
syntax keyword yagpdbccFunction hasRoleID hasRoleName
syntax keyword yagpdbccFunction getRole setRoles
syntax keyword yagpdbccFunction targetHasRoleID targetHasRoleName
    " Current user
syntax keyword yagpdbccFunction currentUserCreated currentUserAgeHuman currentUserAgeMinutes
syntax keyword yagpdbccFunction editNickname
    " Miscellaneous
syntax keyword yagpdbccFunction getMember userArg
syntax keyword yagpdbccFunction onlineCount onlineCountBots
syntax keyword yagpdbccFunction adjective noun cembed
syntax keyword yagpdbccFunction slice cslice dict sdict index
syntax keyword yagpdbccFunction exec execAdmin
syntax keyword yagpdbccFunction hasPrefix hasSuffix
syntax keyword yagpdbccFunction humanizeThousands
syntax keyword yagpdbccFunction in inFold
syntax keyword yagpdbccFunction kindOf len
syntax keyword yagpdbccFunction parseArgs carg
syntax keyword yagpdbccFunction sendTemplate senTemplateDM
syntax keyword yagpdbccFunction seq sort shuffle
syntax keyword yagpdbccFunction sleep call urlquery
    " execCC funcs
syntax keyword yagpdbccFunction execCC scheduleUniqueCC cancelScheduledUniqueCC
    " Ticket funcs
syntax keyword yagpdbccFunction createTicket
    " Database
syntax keyword yagpdbccFunction dbBottomEntries dbTopEntries
syntax keyword yagpdbccFunction dbDel dbDelByID dbDelMultiple
syntax keyword yagpdbccFunction dbGet dbGetPattern dbGetPatternReverse
syntax keyword yagpdbccFunction dbCount dbIncr dbRank dbSetExpire
    " Finalization
highlight link yagpdbccFunction Function

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
highlight link yagpdbccConditional Conditional
highlight link yagpdbccRepeat Repeat
highlight link yagpdbccLabel Label
highlight link yagpdbccOperator Operator
highlight link yagpdbccKeyword Keyword

" Type
syntax match yagpdbccDot "\v(\{\{|\s)\."ms=e
syntax match yagpdbccStruct "\v(\.[[:alnum:]\_]+)+"
    " Order is key here. If you do the dot second, it takes priority over the
    " generic struct/attribute syntax, breaking it.
highlight link yagpdbccDot Type
highlight link yagpdbccStruct Type

" Special
"   Any special symbol
syntax match yagpdbccEscaped "\v\\[nt\"\\]" contained
highlight link yagpdbccEscaped Special
syntax match yagpdbccFormat "\v\%\d?[dfsu\%]" contained
    " This is *mostly* accurate, for now. Should probably be improved later.
highlight link yagpdbccFormat Special

" Ignore
syntax region yagpdbccIgnore start=#\v%^(\{\{)@!# end=#\v\{\{#me=s-1 start=#\v\}\}#ms=e+1 end=#\v%$# contains=@Spell
highlight link yagpdbccIgnore Normal
    " Instead of using the actual Ignore group, which is normally invisible,
    " we just link to the Normal highlight.

" Error
"   Error highlighting should apply to:
"   - Nested double braces
"   - Unclosed parens, brackets, double quotes (must close before the ending `{{`)
"   - Everything after 2K characters
"   Use regex for this. Will need DZ.

" Todo
syntax keyword yagpdbccTodo TODO FIXME XXX
highlight link yagpdbccTodo Todo


let b:current_syntax = "yagpdbcc"
