local M = {}

M.config = function()
    lvim.leader = "space"
    -- add your own keymapping
    lvim.keys.normal_mode["<D-s>"] = ":w<cr>"
    lvim.keys.normal_mode["|"] = ":vsplit<CR>"
    lvim.keys.normal_mode["-"] = ":split<CR>"

    -- Better window navigation in alacritty
    -- lvim.keys.normal_mode["<m-h>"] = "<C-w>h"
    -- lvim.keys.normal_mode["<m-j>"] = "<C-w>j"
    -- lvim.keys.normal_mode["<m-k>"] = "<C-w>k"
    -- lvim.keys.normal_mode["<m-l>"] = "<C-w>l"
    -- lvim.keys.normal_mode["<C-j>"] = "5j"
    -- lvim.keys.normal_mode["<C-k>"] = "5k"
    -- lvim.keys.normal_mode["<C-h>"] = "5h"
    -- lvim.keys.normal_mode["<C-l>"] = "5l"

    -- Better window navigation in iterm2
    lvim.keys.normal_mode["<C-h>"] = "<C-w>h"
    lvim.keys.normal_mode["<C-j>"] = "5j"
    lvim.keys.normal_mode["<C-k>"] = "5k"
    lvim.keys.normal_mode["<C-l>"] = "<C-w>l"

    -- keeps your cursor at the center of the screen in all contexts.
    -- lvim.keys.normal_mode["k"] = "kzz"
    -- lvim.keys.normal_mode["j"] = "jzz"
    -- lvim.keys.normal_mode["n"] = "nzzzv"

    lvim.keys.normal_mode["H"] = "^"
    lvim.keys.normal_mode["L"] = "$"

    -- Support for pasting text without copying underlying visual-selected text.
    lvim.keys.visual_mode["p"] = '"_dP'
end

return M
