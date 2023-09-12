local M = {}

M.config = function()
    lvim.builtin.indentlines.options.show_current_context = true
    lvim.builtin.indentlines.options.show_current_context_start = true
end

return M
