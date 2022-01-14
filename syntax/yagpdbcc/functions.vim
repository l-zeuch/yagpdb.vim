" Vim syntax file
" Add-on file, containing function keywords

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

" Functions, defined by <https://docs.yagpdb.xyz/reference/templates#functions>
    " Type conversion
syntax keyword yagpdbccFunction json structToSdict contained
syntax keyword yagpdbccFunction toByte toDuration toFloat toInt toInt64 toRune toString contained
syntax keyword yagpdbccFunction str contained
    " String manipulation
syntax keyword yagpdbccFunction joinStr lower upper slice urlescape split title contained
syntax keyword yagpdbccFunction reFind reFindAll reFindAllSubmatches reReplace reSplit contained
syntax keyword yagpdbccFunction print printf println js html contained
    " Math functions
syntax keyword yagpdbccFunction randInt round roundCeil roundFloor roundEven contained
    " Message functions
syntax keyword yagpdbccFunction addMessageReactions addReactions addResponseReactions contained
syntax keyword yagpdbccFunction deleteAllMessageReactions deleteMessageReaction contained
syntax keyword yagpdbccFunction complexMessage complexMessageEdit contained
syntax keyword yagpdbccFunction deleteMessage deleteResponse deleteTrigger contained
syntax keyword yagpdbccFunction editMessage editMessageNoEscape contained
syntax keyword yagpdbccFunction getMessage contained
syntax keyword yagpdbccFunction sendDM sendMessage sendMessageNoEscape contained
syntax keyword yagpdbccFunction sendMessageRetID sendMessageNoEscapeRetID contained
    " Channel
syntax keyword yagpdbccFunction getChannel editChannelTopic editChannelName contained
    " Mentions
syntax keyword yagpdbccFunction mentionEveryone mentionHere mentionRoleName mentionRoleID contained
    " Role functions
syntax keyword yagpdbccFunction addRoleID addRoleName removeRoleID removeRoleName contained
syntax keyword yagpdbccFunction giveRoleID giveRoleName takeRoleID takeRoleName contained
syntax keyword yagpdbccFunction hasRoleID hasRoleName contained
syntax keyword yagpdbccFunction getRole setRoles contained
syntax keyword yagpdbccFunction targetHasRoleID targetHasRoleName contained
    " Current user
syntax keyword yagpdbccFunction currentUserCreated currentUserAgeHuman currentUserAgeMinutes contained
syntax keyword yagpdbccFunction editNickname contained
    " Miscellaneous
syntax keyword yagpdbccFunction cslice dict sdict cembed contained
syntax keyword yagpdbccFunction getMember userArg contained
syntax keyword yagpdbccFunction onlineCount onlineCountBots contained
syntax keyword yagpdbccFunction adjective noun index slice contained
syntax keyword yagpdbccFunction exec execAdmin contained
syntax keyword yagpdbccFunction hasPrefix hasSuffix contained
syntax keyword yagpdbccFunction humanizeThousands contained
syntax keyword yagpdbccFunction in inFold contained
syntax keyword yagpdbccFunction kindOf len contained
syntax keyword yagpdbccFunction parseArgs carg contained
syntax keyword yagpdbccFunction sendTemplate senTemplateDM contained
syntax keyword yagpdbccFunction seq sort shuffle contained
syntax keyword yagpdbccFunction sleep call urlquery contained
    " execCC funcs
syntax keyword yagpdbccFunction execCC scheduleUniqueCC cancelScheduledUniqueCC contained
    " Ticket funcs
syntax keyword yagpdbccFunction createTicket contained
    " Database
syntax keyword yagpdbccFunction dbBottomEntries dbTopEntries contained
syntax keyword yagpdbccFunction dbDel dbDelByID dbDelMultiple contained
syntax keyword yagpdbccFunction dbGet dbGetPattern dbGetPatternReverse contained
syntax keyword yagpdbccFunction dbCount dbIncr dbRank dbSetExpire dbSet contained
    " Finalization
highlight default link yagpdbccFunction Function

" Time functions, defined by <https://docs.yagpdb.xyz/reference/templates#time>
syntax keyword yagpdbccTime currentTime formatTime newDate contained
syntax keyword yagpdbccTime humanizeDurationHours humanizeDurationMinutes humanizeDurationSeconds contained
syntax keyword yagpdbccTime humanizeTimeSinceDays contained
    " Finalization
highlight default link yagpdbccTime Function
