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
		{ label = 'editMessage' },
		{ label = 'editMessageNoEscape' },
		{ label = 'pinMessage' },
		{ label = 'publishMessage' },
		{ label = 'publishResponse' },
		{ label = 'sendDM' },
		{ label = 'sendMessage' },
		{ label = 'sendMessageNoEscape' },
		{ label = 'sendMessageNoEscapeRetID' },
		{ label = 'sendMessageRetID' },
		{ label = 'sendTemplate' },
		{ label = 'sendTemplateDM' },
		{ label = 'unpinMessage' },
		{ label = 'mentionEveryone' },
		{ label = 'mentionHere' },
		{ label = 'mentionRole' },
		{ label = 'mentionRoleName' },
		{ label = 'mentionRoleID' },
		{ label = 'getRole' },
		{ label = 'getRoleID' },
		{ label = 'getRoleName' },
		{ label = 'hasRole' },
		{ label = 'hasRoleID' },
		{ label = 'hasRoleName' },
		{ label = 'targetHasRole' },
		{ label = 'targetHasRoleID' },
		{ label = 'targetHasRoleName' },
		{ label = 'giveRole' },
		{ label = 'giveRoleID' },
		{ label = 'giveRoleName' },
		{ label = 'addRole' },
		{ label = 'addRoleID' },
		{ label = 'addRoleName' },
		{ label = 'takeRole' },
		{ label = 'takeRoleID' },
		{ label = 'takeRoleName' },
		{ label = 'removeRole' },
		{ label = 'removeRoleID' },
		{ label = 'removeRoleName' },
		{ label = 'setRoles' },
		{ label = 'hasPermissions' },
		{ label = 'targetHasPermissions' },
		{ label = 'getTargetPermissionsIn' },
		{ label = 'addMessageReactions' },
		{ label = 'addReactions' },
		{ label = 'addResponseReactions' },
		{ label = 'deleteAllMessageReactions' },
		{ label = 'deleteMessage' },
		{ label = 'deleteMessageReaction' },
		{ label = 'deleteResponse' },
		{ label = 'deleteTrigger' },
		{ label = 'getChannel' },
		{ label = 'getChannelPins' },
		{ label = 'getChannelOrThread' },
		{ label = 'getPinCount' },
		{ label = 'getMember' },
		{ label = 'getMessage' },
		{ label = 'getThread' },
		{ label = 'addThreadMember' },
		{ label = 'closeThread' },
		{ label = 'createThread' },
		{ label = 'deleteThread' },
		{ label = 'editThread' },
		{ label = 'openThread' },
		{ label = 'removeThreadMember' },
		{ label = 'createForumPost' },
		{ label = 'deleteForumPost' },
		{ label = 'pinForumPost' },
		{ label = 'unpinForumPost' },
		{ label = 'currentUserAgeHuman' },
		{ label = 'currentUserAgeMinutes' },
		{ label = 'currentUserCreated' },
		{ label = 'reFind' },
		{ label = 'reFindAll' },
		{ label = 'reFindAllSubmatches' },
		{ label = 'reReplace' },
		{ label = 'reSplit' },
		{ label = 'sleep' },
		{ label = 'editChannelName' },
		{ label = 'editChannelTopic' },
		{ label = 'editNickname' },
		{ label = 'onlineCount' },
		{ label = 'onlineCountBots' },
		{ label = 'sort' },
		{ label = 'str' },
		{ label = 'toString' },
		{ label = 'toInt' },
		{ label = 'toInt64' },
		{ label = 'toFloat' },
		{ label = 'toDuration' },
		{ label = 'toRune' },
		{ label = 'toByte' },
		{ label = 'hasPrefix' },
		{ label = 'hasSuffix' },
		{ label = 'joinStr' },
		{ label = 'lower' },
		{ label = 'slice' },
		{ label = 'split' },
		{ label = 'title' },
		{ label = 'trimSpace' },
		{ label = 'upper' },
		{ label = 'urlescape' },
		{ label = 'urlunescape' },
		{ label = 'print' },
		{ label = 'println' },
		{ label = 'printf' },
		{ label = 'sanitizeText' },
		{ label = 'reQuoteMeta' },
		{ label = 'add' },
		{ label = 'cbrt' },
		{ label = 'div' },
		{ label = 'fdiv' },
		{ label = 'log' },
		{ label = 'mathConst' },
		{ label = 'max' },
		{ label = 'min' },
		{ label = 'mod' },
		{ label = 'mult' },
		{ label = 'pow' },
		{ label = 'round' },
		{ label = 'roundCeil' },
		{ label = 'roundEven' },
		{ label = 'roundFloor' },
		{ label = 'sqrt' },
		{ label = 'sub' },
		{ label = 'bitwiseAnd' },
		{ label = 'bitwiseOr' },
		{ label = 'bitwiseXor' },
		{ label = 'bitwiseNot' },
		{ label = 'bitwiseAndNot' },
		{ label = 'bitwiseLeftShift' },
		{ label = 'bitwiseRightShift' },
		{ label = 'humanizeThousands' },
		{ label = 'dict' },
		{ label = 'sdict' },
		{ label = 'structToSdict' },
		{ label = 'cembed' },
		{ label = 'cbutton' },
		{ label = 'cmenu' },
		{ label = 'cmodal' },
		{ label = 'cslice' },
		{ label = 'complexMessage' },
		{ label = 'complexMessageEdit' },
		{ label = 'kindOf' },
		{ label = 'adjective' },
		{ label = 'in' },
		{ label = 'inFold' },
		{ label = 'json' },
		{ label = 'jsonToSdict' },
		{ label = 'noun' },
		{ label = 'randInt' },
		{ label = 'roleAbove' },
		{ label = 'seq' },
		{ label = 'shuffle' },
		{ label = 'verb' },
		{ label = 'currentTime' },
		{ label = 'parseTime' },
		{ label = 'formatTime' },
		{ label = 'loadLocation' },
		{ label = 'newDate' },
		{ label = 'snowflakeToTime' },
		{ label = 'timestampToTime' },
		{ label = 'weekNumber' },
		{ label = 'humanizeDurationHours' },
		{ label = 'humanizeDurationMinutes' },
		{ label = 'humanizeDurationSeconds' },
		{ label = 'humanizeTimeSinceDays' },
		{ label = 'editResponse' },
		{ label = 'editResponseNoEscape' },
		{ label = 'ephemeralResponse' },
		{ label = 'getResponse' },
		{ label = 'sendModal' },
		{ label = 'sendResponse' },
		{ label = 'sendResponseNoEscape' },
		{ label = 'sendResponseNoEscapeRetID' },
		{ label = 'sendResponseRetID' },
		{ label = 'updateMessage' },
		{ label = 'updateMessageNoEscape' },
		{ label = 'and' },
		{ label = 'call' },
		{ label = 'execTemplate' },
		{ label = 'html' },
		{ label = 'index' },
		{ label = 'js' },
		{ label = 'len' },
		{ label = 'not' },
		{ label = 'or' },
		{ label = 'urlquery' },
		{ label = 'eq' },
		{ label = 'ge' },
		{ label = 'gt' },
		{ label = 'le' },
		{ label = 'lt' },
		{ label = 'ne' },
		{ label = 'pastUsernames' },
		{ label = 'pastNicknames' },
		{ label = 'createTicket' },
		{ label = 'exec' },
		{ label = 'execAdmin' },
		{ label = 'userArg' },
		{ label = 'parseArgs' },
		{ label = 'carg' },
		{ label = 'execCC' },
		{ label = 'scheduleUniqueCC' },
		{ label = 'cancelScheduledUniqueCC' },
		{ label = 'dbSet' },
		{ label = 'dbSetExpire' },
		{ label = 'dbIncr' },
		{ label = 'dbGet' },
		{ label = 'dbGetPattern' },
		{ label = 'dbGetPatternReverse' },
		{ label = 'dbDel' },
		{ label = 'dbDelById' },
		{ label = 'dbDelByID' },
		{ label = 'dbDelMultiple' },
		{ label = 'dbTopEntries' },
		{ label = 'dbBottomEntries' },
		{ label = 'dbCount' },
		{ label = 'dbRank' },
		{ label = 'if' },
		{ label = 'else' },
		{ label = 'with' },
		{ label = 'try' },
		{ label = 'catch' },
		{ label = 'true' },
		{ label = 'false' },
		{ label = 'range' },
		{ label = 'while' },
		{ label = 'define' },
		{ label = 'template' },
		{ label = 'block' },
		{ label = 'nil' },
		{ label = 'end' },
		{ label = 'return' },
		{ label = 'break' },
		{ label = 'continue' }
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
