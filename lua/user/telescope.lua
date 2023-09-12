local M = {}

M.config = function()
    lvim.builtin.telescope.pickers.live_grep = {
        only_sort_text = true,
    }
end

return M

