local M = {}

M.config = function()
    lvim.builtin.telescope.pickers.find_files = {
        hidden = false,
    }

    -- Reference:
    -- https://gitlab.com/lostneophyte/dotfiles/-/blob/5d49006532bf57db9f7e09564cb43010f631c571/lvim/.config/lvim/lua/user/telescope.lua
    lvim.builtin.telescope.defaults.layout_config = {
        prompt_position = "top",
        height = 0.85,
        width = 0.85,
        bottom_pane = {
            height = 25,
            preview_cutoff = 120,
        },
        center = {
            height = 0.4,
            preview_cutoff = 40,
            width = 0.5,
        },
        cursor = {
            preview_cutoff = 40,
        },
        horizontal = {
            preview_cutoff = 120,
            preview_width = 0.6,
        },
        vertical = {
            preview_cutoff = 40,
        },
        flex = {
            flip_columns = 150,
        },
    }
    -- lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
    lvim.builtin.telescope.defaults.layout_strategy = "flex"
    lvim.builtin.telescope.defaults.prompt_prefix = " "
    lvim.builtin.telescope.defaults.selection_caret = "❯ "
    lvim.builtin.telescope.defaults.winblend = 10
end

return M
