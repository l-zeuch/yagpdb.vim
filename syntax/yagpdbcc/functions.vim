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

" Channel
syntax keyword yagpdbccFunction editChannelName editChannelTopic contained
syntax keyword yagpdbccFunction getChannel getChannelOrThread contained
syntax keyword yagpdbccFunction getPinCount getThread contained

" Database
syntax keyword yagpdbccFunction dbBottomEntries dbCount dbDel dbSet contained
syntax keyword yagpdbccFunction dbDelByID dbDelMultiple dbGet contained
syntax keyword yagpdbccFunction dbGetPattern dbGetPatternReverse contained
syntax keyword yagpdbccFunction dbIncr dbRank dbSetExpire dbTopEntries contained

" Math
syntax keyword yagpdbccFunction add cbrt div fdiv log mod mult pow contained
syntax keyword yagpdbccFunction randInt round roundCeil roundEven contained
syntax keyword yagpdbccFunction roundFloor sqrt sub contained

" Member
syntax keyword yagpdbccFunction editNickname getMember onlineCount contained

" Mentions
syntax keyword yagpdbccFunction mentionEveryone mentionHere contained
syntax keyword yagpdbccFunction mentionRoleID mentionRoleName contained

" Message
syntax keyword yagpdbccFunction addMessageReactions addReactions contained
syntax keyword yagpdbccFunction addResponseReactions complexMessage contained
syntax keyword yagpdbccFunction complexMessageEdit deleteMessage contained
syntax keyword yagpdbccFunction deleteAllMessageReactions editMessage contained
syntax keyword yagpdbccFunction deleteMessageReaction deleteResponse contained
syntax keyword yagpdbccFunction deleteTrigger editMessageNoEscape contained
syntax keyword yagpdbccFunction getMessage pinMessage sendDM contained
syntax keyword yagpdbccFunction sendMessage sendMessageNoEscape contained
syntax keyword yagpdbccFunction sendMessageNoEscapeRetID unpinMessage contained

" Misc
syntax keyword yagpdbccFunction adjective carg cembed createTicket contained
syntax keyword yagpdbccFunction cslice sdict dict exec execAdmin contained
syntax keyword yagpdbccFunction hasSuffix humanizeThousands in index contained
syntax keyword yagpdbccFunction inFold kindOf len noun parseArgs contained
syntax keyword yagpdbccFunction sendTemplate sendTemplateDM seq range contained
syntax keyword yagpdbccFunction shuffle sleep sort execCC contained
syntax keyword yagpdbccFunction scheduleUniqueCC hasPrefix contained

" Role
syntax keyword yagpdbccFunction addRoleID addRoleName getRole contained
syntax keyword yagpdbccFunction giveRoleID giveRoleName hasRoleID contained
syntax keyword yagpdbccFunction hasRoleName removeRoleID contained
syntax keyword yagpdbccFunction removeRoleName roleAbove setRoles contained
syntax keyword yagpdbccFunction setRoles takeRoleID takeRoleName contained
syntax keyword yagpdbccFunction targetHasRoleID targetHasRoleName contained

" Strings
syntax keyword yagpdbccFunction joinStr lower print printf println contained
syntax keyword yagpdbccFunction reFind reFindAll reFindAllSubmatches contained
syntax keyword yagpdbccFunction reReplace reSplit slice split contained
syntax keyword yagpdbccFunction title trimSpace upper urlescape contained
syntax keyword yagpdbccFunction js html contained

" Time
syntax keyword yagpdbccFunction currentTime formatTime contained
syntax keyword yagpdbccFunction humanizeDurationHours contained
syntax keyword yagpdbccFunction humanizeDurationMinutes contained
syntax keyword yagpdbccFunction humanizeDurationSeconds contained
syntax keyword yagpdbccFunction humanizeTimeSinceDays contained
syntax keyword yagpdbccFunction loadLocation newDate contained
syntax keyword yagpdbccFunction snowflakeToTime weekNumber contained

" Type conversion
syntax keyword yagpdbccFunction json structToSdict toByte toDuration contained
syntax keyword yagpdbccFunction toFloat toInt toInt64 toRune ToString contained

" User
syntax keyword yagpdbccFunction currentUserAgeHuman contained
syntax keyword yagpdbccFunction currentUserAgeMinutes contained
syntax keyword yagpdbccFunction currentUserCreated contained
syntax keyword yagpdbccFunction pastNicknames pastUsernames userArg contained

" Finally
highlight link yagpdbccFunction Function
