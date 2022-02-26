local source = {}

---Return this source is available in current context or not.
---@return boolean
function source:is_available()
    return true
end

---Return the debug name of this source.
---@return string
function source:get_debug_name()
    return 'yagpdb-cc'
end

---Return keyword pattern for triggering completion.
---@return string
function source:get_keyword_pattern()
    return [[{{.*}}]]
end

---@@cmp-src@@

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
require('cmp').register_source('yagpdbcc', source.new())
