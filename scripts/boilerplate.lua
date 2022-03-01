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
---@@cmp-src@@
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
require('cmp').register_source('yagpdb-cc', source.new())
