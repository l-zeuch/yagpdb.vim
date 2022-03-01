-- Source completion file for use with https://github.com/hrsh7th/nvim-cmp.
-- Automatically generated. DO NOT EDIT.
--
-- Copyright (C) 2021    Lucas Ritzdorf, Luca Zeuch
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

local source = {}

source.new = function()
    local self = setmetatable({}, { __index = source })
    return self
end

---Return this source is available in current context or not.
---@return boolean
function source:is_available()
    if (vim.bo.filetype == 'yagpdbcc') then
        return true
    else
        return false
    end
end

---Return the debug name of this source.
---@return string
function source:get_debug_name()
    return 'yagpdb-cc'
end

---Invoke completion. (Required)
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
    callback({
		{ label = 'true' },
		{ label = 'false' },
		{ label = 'if' },
		{ label = 'else' },
		{ label = 'range' },
		{ label = 'with' },
		{ label = 'define' },
		{ label = 'template' },
		{ label = 'block' },
		{ label = 'not' },
		{ label = 'and' },
		{ label = 'or' },
		{ label = 'ne' },
		{ label = 'eq' },
		{ label = 'lt' },
		{ label = 'le' },
		{ label = 'gt' },
		{ label = 'ge' },
		{ label = 'add' },
		{ label = 'sub' },
		{ label = 'mult' },
		{ label = 'div' },
		{ label = 'fdiv' },
		{ label = 'log' },
		{ label = 'mod' },
		{ label = 'pow' },
		{ label = 'sqrt' },
		{ label = 'nil' },
		{ label = 'end' },
		{ label = 'editChannelName' },
		{ label = 'editChannelTopic' },
		{ label = 'getChannel' },
		{ label = 'getChannelOrThread' },
		{ label = 'getPinCount' },
		{ label = 'getThread' },
		{ label = 'dbBottomEntries' },
		{ label = 'dbCount' },
		{ label = 'dbDel' },
		{ label = 'dbSet' },
		{ label = 'dbDelByID' },
		{ label = 'dbDelMultiple' },
		{ label = 'dbGet' },
		{ label = 'dbGetPattern' },
		{ label = 'dbGetPatternReverse' },
		{ label = 'dbIncr' },
		{ label = 'dbRank' },
		{ label = 'dbSetExpire' },
		{ label = 'dbTopEntries' },
		{ label = 'add' },
		{ label = 'cbrt' },
		{ label = 'div' },
		{ label = 'fdiv' },
		{ label = 'log' },
		{ label = 'mod' },
		{ label = 'mult' },
		{ label = 'pow' },
		{ label = 'randInt' },
		{ label = 'round' },
		{ label = 'roundCeil' },
		{ label = 'roundEven' },
		{ label = 'roundFloor' },
		{ label = 'sqrt' },
		{ label = 'sub' },
		{ label = 'editNickname' },
		{ label = 'getMember' },
		{ label = 'onlineCount' },
		{ label = 'mentionEveryone' },
		{ label = 'mentionHere' },
		{ label = 'mentionRoleID' },
		{ label = 'mentionRoleName' },
		{ label = 'addMessageReactions' },
		{ label = 'addReactions' },
		{ label = 'addResponseReactions' },
		{ label = 'complexMessage' },
		{ label = 'complexMessageEdit' },
		{ label = 'deleteMessage' },
		{ label = 'deleteAllMessageReactions' },
		{ label = 'editMessage' },
		{ label = 'deleteMessageReaction' },
		{ label = 'deleteResponse' },
		{ label = 'deleteTrigger' },
		{ label = 'editMessageNoEscape' },
		{ label = 'getMessage' },
		{ label = 'pinMessage' },
		{ label = 'sendDM' },
		{ label = 'sendMessage' },
		{ label = 'sendMessageNoEscape' },
		{ label = 'sendMessageNoEscapeRetID' },
		{ label = 'unpinMessage' },
		{ label = 'adjective' },
		{ label = 'carg' },
		{ label = 'cembed' },
		{ label = 'createTicket' },
		{ label = 'cslice' },
		{ label = 'sdict' },
		{ label = 'dict' },
		{ label = 'exec' },
		{ label = 'execAdmin' },
		{ label = 'hasSuffix' },
		{ label = 'humanizeThousands' },
		{ label = 'in' },
		{ label = 'index' },
		{ label = 'inFold' },
		{ label = 'kindOf' },
		{ label = 'len' },
		{ label = 'noun' },
		{ label = 'parseArgs' },
		{ label = 'sendTemplate' },
		{ label = 'sendTemplateDM' },
		{ label = 'seq' },
		{ label = 'range' },
		{ label = 'shuffle' },
		{ label = 'sleep' },
		{ label = 'sort' },
		{ label = 'execCC' },
		{ label = 'scheduleUniqueCC' },
		{ label = 'hasPrefix' },
		{ label = 'addRoleID' },
		{ label = 'addRoleName' },
		{ label = 'getRole' },
		{ label = 'giveRoleID' },
		{ label = 'giveRoleName' },
		{ label = 'hasRoleID' },
		{ label = 'hasRoleName' },
		{ label = 'removeRoleID' },
		{ label = 'removeRoleName' },
		{ label = 'roleAbove' },
		{ label = 'setRoles' },
		{ label = 'setRoles' },
		{ label = 'takeRoleID' },
		{ label = 'takeRoleName' },
		{ label = 'targetHasRoleID' },
		{ label = 'targetHasRoleName' },
		{ label = 'joinStr' },
		{ label = 'lower' },
		{ label = 'print' },
		{ label = 'printf' },
		{ label = 'println' },
		{ label = 'reFind' },
		{ label = 'reFindAll' },
		{ label = 'reFindAllSubmatches' },
		{ label = 'reReplace' },
		{ label = 'reSplit' },
		{ label = 'slice' },
		{ label = 'split' },
		{ label = 'title' },
		{ label = 'trimSpace' },
		{ label = 'upper' },
		{ label = 'urlescape' },
		{ label = 'js' },
		{ label = 'html' },
		{ label = 'currentTime' },
		{ label = 'formatTime' },
		{ label = 'humanizeDurationHours' },
		{ label = 'humanizeDurationMinutes' },
		{ label = 'humanizeDurationSeconds' },
		{ label = 'humanizeTimeSinceDays' },
		{ label = 'loadLocation' },
		{ label = 'newDate' },
		{ label = 'snowflakeToTime' },
		{ label = 'weekNumber' },
		{ label = 'json' },
		{ label = 'structToSdict' },
		{ label = 'toByte' },
		{ label = 'toDuration' },
		{ label = 'toFloat' },
		{ label = 'toInt' },
		{ label = 'toInt64' },
		{ label = 'toRune' },
		{ label = 'ToString' },
		{ label = 'str' },
		{ label = 'currentUserAgeHuman' },
		{ label = 'currentUserAgeMinutes' },
		{ label = 'currentUserCreated' },
		{ label = 'pastNicknames' },
		{ label = 'pastUsernames' },
		{ label = 'userArg' }
    })
end

---Resolve completion item.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:resolve(completion_item, callback)
    callback(completion_item)
end

---Execute command after item was accepted.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
    callback(completion_item)
end

---Register custom source to nvim-cmp.
local hascmp, cmp = pcall(require, 'cmp')
if hascmp then
    cmp.register_source('yagpdb-cc', source.new())
end
