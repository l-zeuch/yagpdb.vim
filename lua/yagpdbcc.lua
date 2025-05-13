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
		{ label = 'abs' },
		{ label = 'add' },
		{ label = 'addMessageReactions' },
		{ label = 'addReactions' },
		{ label = 'addResponseReactions' },
		{ label = 'addRole' },
		{ label = 'addRoleID' },
		{ label = 'addRoleName' },
		{ label = 'addThreadMember' },
		{ label = 'adjective' },
		{ label = 'and' },
		{ label = 'bitwiseAnd' },
		{ label = 'bitwiseAndNot' },
		{ label = 'bitwiseLeftShift' },
		{ label = 'bitwiseNot' },
		{ label = 'bitwiseOr' },
		{ label = 'bitwiseRightShift' },
		{ label = 'bitwiseXor' },
		{ label = 'block' },
		{ label = 'break' },
		{ label = 'call' },
		{ label = 'cancelScheduledUniqueCC' },
		{ label = 'carg' },
		{ label = 'catch' },
		{ label = 'cbrt' },
		{ label = 'cbutton' },
		{ label = 'cembed' },
		{ label = 'closeThread' },
		{ label = 'cmenu' },
		{ label = 'cmodal' },
		{ label = 'complexMessage' },
		{ label = 'complexMessageEdit' },
		{ label = 'componentBuilder' },
		{ label = 'continue' },
		{ label = 'createForumPost' },
		{ label = 'createThread' },
		{ label = 'createTicket' },
		{ label = 'cslice' },
		{ label = 'currentTime' },
		{ label = 'currentUserAgeHuman' },
		{ label = 'currentUserAgeMinutes' },
		{ label = 'currentUserCreated' },
		{ label = 'dbBottomEntries' },
		{ label = 'dbCount' },
		{ label = 'dbDel' },
		{ label = 'dbDelByID' },
		{ label = 'dbDelById' },
		{ label = 'dbDelMultiple' },
		{ label = 'dbGet' },
		{ label = 'dbGetPattern' },
		{ label = 'dbGetPatternReverse' },
		{ label = 'dbIncr' },
		{ label = 'dbRank' },
		{ label = 'dbSet' },
		{ label = 'dbSetExpire' },
		{ label = 'dbTopEntries' },
		{ label = 'decodeBase64' },
		{ label = 'define' },
		{ label = 'deleteAllMessageReactions' },
		{ label = 'deleteForumPost' },
		{ label = 'deleteInteractionResponse' },
		{ label = 'deleteMessage' },
		{ label = 'deleteMessageReaction' },
		{ label = 'deleteResponse' },
		{ label = 'deleteThread' },
		{ label = 'deleteTrigger' },
		{ label = 'dict' },
		{ label = 'div' },
		{ label = 'editChannelName' },
		{ label = 'editChannelTopic' },
		{ label = 'editComponentMessage' },
		{ label = 'editComponentMessageNoEscape' },
		{ label = 'editMessage' },
		{ label = 'editMessageNoEscape' },
		{ label = 'editNickname' },
		{ label = 'editResponse' },
		{ label = 'editResponseNoEscape' },
		{ label = 'editThread' },
		{ label = 'else' },
		{ label = 'encodeBase64' },
		{ label = 'end' },
		{ label = 'ephemeralResponse' },
		{ label = 'eq' },
		{ label = 'exec' },
		{ label = 'execAdmin' },
		{ label = 'execCC' },
		{ label = 'execTemplate' },
		{ label = 'false' },
		{ label = 'fdiv' },
		{ label = 'formatTime' },
		{ label = 'ge' },
		{ label = 'getChannel' },
		{ label = 'getChannelOrThread' },
		{ label = 'getChannelPins' },
		{ label = 'getMember' },
		{ label = 'getMemberVoiceState' },
		{ label = 'getMessage' },
		{ label = 'getPinCount' },
		{ label = 'getResponse' },
		{ label = 'getRole' },
		{ label = 'getRoleID' },
		{ label = 'getRoleName' },
		{ label = 'getTargetPermissionsIn' },
		{ label = 'getThread' },
		{ label = 'giveRole' },
		{ label = 'giveRoleID' },
		{ label = 'giveRoleName' },
		{ label = 'gt' },
		{ label = 'hasPermissions' },
		{ label = 'hasPrefix' },
		{ label = 'hasRole' },
		{ label = 'hasRoleID' },
		{ label = 'hasRoleName' },
		{ label = 'hasSuffix' },
		{ label = 'hash' },
		{ label = 'html' },
		{ label = 'humanizeDurationHours' },
		{ label = 'humanizeDurationMinutes' },
		{ label = 'humanizeDurationSeconds' },
		{ label = 'humanizeThousands' },
		{ label = 'humanizeTimeSinceDays' },
		{ label = 'if' },
		{ label = 'in' },
		{ label = 'inFold' },
		{ label = 'index' },
		{ label = 'joinStr' },
		{ label = 'js' },
		{ label = 'json' },
		{ label = 'jsonToSdict' },
		{ label = 'kindOf' },
		{ label = 'le' },
		{ label = 'len' },
		{ label = 'loadLocation' },
		{ label = 'log' },
		{ label = 'lower' },
		{ label = 'lt' },
		{ label = 'mathConst' },
		{ label = 'max' },
		{ label = 'mentionEveryone' },
		{ label = 'mentionHere' },
		{ label = 'mentionRole' },
		{ label = 'mentionRoleID' },
		{ label = 'mentionRoleName' },
		{ label = 'min' },
		{ label = 'mod' },
		{ label = 'mult' },
		{ label = 'ne' },
		{ label = 'newDate' },
		{ label = 'nil' },
		{ label = 'not' },
		{ label = 'noun' },
		{ label = 'onlineCount' },
		{ label = 'onlineCountBots' },
		{ label = 'openThread' },
		{ label = 'or' },
		{ label = 'parseArgs' },
		{ label = 'parseTime' },
		{ label = 'pastNicknames' },
		{ label = 'pastUsernames' },
		{ label = 'pinForumPost' },
		{ label = 'pinMessage' },
		{ label = 'pow' },
		{ label = 'print' },
		{ label = 'printf' },
		{ label = 'println' },
		{ label = 'publishMessage' },
		{ label = 'publishResponse' },
		{ label = 'randInt' },
		{ label = 'range' },
		{ label = 'reFind' },
		{ label = 'reFindAll' },
		{ label = 'reFindAllSubmatches' },
		{ label = 'reQuoteMeta' },
		{ label = 'reReplace' },
		{ label = 'reSplit' },
		{ label = 'removeRole' },
		{ label = 'removeRoleID' },
		{ label = 'removeRoleName' },
		{ label = 'removeThreadMember' },
		{ label = 'return' },
		{ label = 'roleAbove' },
		{ label = 'round' },
		{ label = 'roundCeil' },
		{ label = 'roundEven' },
		{ label = 'roundFloor' },
		{ label = 'sanitizeText' },
		{ label = 'scheduleUniqueCC' },
		{ label = 'sdict' },
		{ label = 'sendComponentMessage' },
		{ label = 'sendComponentMessageNoEscape' },
		{ label = 'sendComponentMessageNoEscapeRetID' },
		{ label = 'sendComponentMessageRetID' },
		{ label = 'sendDM' },
		{ label = 'sendMessage' },
		{ label = 'sendMessageNoEscape' },
		{ label = 'sendMessageNoEscapeRetID' },
		{ label = 'sendMessageRetID' },
		{ label = 'sendModal' },
		{ label = 'sendResponse' },
		{ label = 'sendResponseNoEscape' },
		{ label = 'sendResponseNoEscapeRetID' },
		{ label = 'sendResponseRetID' },
		{ label = 'sendTemplate' },
		{ label = 'sendTemplateDM' },
		{ label = 'seq' },
		{ label = 'setRoles' },
		{ label = 'shuffle' },
		{ label = 'sleep' },
		{ label = 'slice' },
		{ label = 'snowflakeToTime' },
		{ label = 'sort' },
		{ label = 'split' },
		{ label = 'sqrt' },
		{ label = 'str' },
		{ label = 'structToSdict' },
		{ label = 'sub' },
		{ label = 'takeRole' },
		{ label = 'takeRoleID' },
		{ label = 'takeRoleName' },
		{ label = 'targetHasPermissions' },
		{ label = 'targetHasRole' },
		{ label = 'targetHasRoleID' },
		{ label = 'targetHasRoleName' },
		{ label = 'template' },
		{ label = 'timestampToTime' },
		{ label = 'title' },
		{ label = 'toByte' },
		{ label = 'toDuration' },
		{ label = 'toFloat' },
		{ label = 'toInt' },
		{ label = 'toInt64' },
		{ label = 'toRune' },
		{ label = 'toString' },
		{ label = 'trimSpace' },
		{ label = 'true' },
		{ label = 'try' },
		{ label = 'unpinForumPost' },
		{ label = 'unpinMessage' },
		{ label = 'updateMessage' },
		{ label = 'updateMessageNoEscape' },
		{ label = 'upper' },
		{ label = 'urlescape' },
		{ label = 'urlquery' },
		{ label = 'urlunescape' },
		{ label = 'userArg' },
		{ label = 'verb' },
		{ label = 'weekNumber' },
		{ label = 'while' },
		{ label = 'with' }
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
