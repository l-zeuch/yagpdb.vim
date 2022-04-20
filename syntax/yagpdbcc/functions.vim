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

" See https://docs.yagpdb.xyz/reference/templates/functions
" for a list of all functions defined.

" Channel
syn keyword yagFunc editChannelName editChannelTopic contained
syn keyword yagFunc getChannel getChannelOrThread contained
syn keyword yagFunc getPinCount getThread contained

" Database
syn keyword yagFunc dbBottomEntries dbCount dbDel dbSet contained
syn keyword yagFunc dbDelByID dbDelMultiple dbGet contained
syn keyword yagFunc dbGetPattern dbGetPatternReverse contained
syn keyword yagFunc dbIncr dbRank dbSetExpire dbTopEntries contained

" Math
syn keyword yagFunc add cbrt div fdiv log mod mult pow contained
syn keyword yagFunc randInt round roundCeil roundEven contained
syn keyword yagFunc roundFloor sqrt sub contained

" Logic
syn keyword yagFunc not and or ne eq lt le gt ge contained

" Member
syn keyword yagFunc editNickname getMember onlineCount contained

" Mentions
syn keyword yagFunc mentionEveryone mentionHere contained
syn keyword yagFunc mentionRoleID mentionRoleName contained

" Message
syn keyword yagFunc addMessageReactions addReactions contained
syn keyword yagFunc addResponseReactions complexMessage contained
syn keyword yagFunc complexMessageEdit deleteMessage contained
syn keyword yagFunc deleteAllMessageReactions editMessage contained
syn keyword yagFunc deleteMessageReaction deleteResponse contained
syn keyword yagFunc deleteTrigger editMessageNoEscape contained
syn keyword yagFunc getMessage pinMessage sendDM contained
syn keyword yagFunc sendMessage sendMessageNoEscape contained
syn keyword yagFunc sendMessageNoEscapeRetID unpinMessage contained

" Misc
syn keyword yagFunc adjective carg cembed createTicket contained
syn keyword yagFunc cslice sdict dict exec execAdmin contained
syn keyword yagFunc hasSuffix humanizeThousands in index contained
syn keyword yagFunc inFold kindOf len noun parseArgs contained
syn keyword yagFunc sendTemplate sendTemplateDM seq range contained
syn keyword yagFunc shuffle sleep sort execCC contained
syn keyword yagFunc scheduleUniqueCC hasPrefix contained
syn keyword yagFunc execTemplate contained

" Role
syn keyword yagFunc addRoleID addRoleName getRole contained
syn keyword yagFunc giveRoleID giveRoleName hasRoleID contained
syn keyword yagFunc hasRoleName removeRoleID contained
syn keyword yagFunc removeRoleName roleAbove setRoles contained
syn keyword yagFunc setRoles takeRoleID takeRoleName contained
syn keyword yagFunc targetHasRoleID targetHasRoleName contained

" Strings
syn keyword yagFunc joinStr lower print printf println contained
syn keyword yagFunc reFind reFindAll reFindAllSubmatches contained
syn keyword yagFunc reReplace reSplit slice split contained
syn keyword yagFunc title trimSpace upper urlescape contained
syn keyword yagFunc urlunescape js html contained

" Time
syn keyword yagFunc currentTime formatTime contained
syn keyword yagFunc humanizeDurationHours contained
syn keyword yagFunc humanizeDurationMinutes contained
syn keyword yagFunc humanizeDurationSeconds contained
syn keyword yagFunc humanizeTimeSinceDays contained
syn keyword yagFunc loadLocation newDate contained
syn keyword yagFunc snowflakeToTime weekNumber contained

" Type conversion
syn keyword yagFunc json structToSdict toByte toDuration contained
syn keyword yagFunc toFloat toInt toInt64 toRune ToString contained
syn keyword yagFunc str contained

" User
syn keyword yagFunc currentUserAgeHuman contained
syn keyword yagFunc currentUserAgeMinutes contained
syn keyword yagFunc currentUserCreated contained
syn keyword yagFunc pastNicknames pastUsernames userArg contained

" Finally
highlight link yagFunc Function
