" Vim syntax file
" Add-on file, containing function keywords
" Language: YAGPDB Custom Commands
" Maintainer: Luca Zeuch <l-zeuch@email.de>,
"   LRitzdorf <42657792+LRitzdorf@users.noreply.github.com>

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
