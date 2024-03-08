local M = {}

M.config = function()
    lvim.leader = "space"
    -- add your own keymapping
    lvim.keys.normal_mode["<D-s>"] = ":w<cr>"
    lvim.keys.normal_mode["|"] = ":vsplit<CR>"
    lvim.keys.normal_mode["-"] = ":split<CR>"

    -- Better window movement
    -- lvim.keys.normal_mode["<C-H>"] = "<C-w>h"
    -- lvim.keys.normal_mode["<C-J>"] = "<C-w>j"
    -- lvim.keys.normal_mode["<C-K>"] = "<C-w>k"
    -- lvim.keys.normal_mode["<C-L>"] = "<C-w>l"

    lvim.keys.normal_mode["<C-j>"] = "5j"
    lvim.keys.normal_mode["<C-k>"] = "5k"
    lvim.keys.normal_mode["<C-h>"] = "5h"
    lvim.keys.normal_mode["<C-l>"] = "5l"
    lvim.keys.normal_mode["H"] = "^"
    lvim.keys.normal_mode["L"] = "$"
end

return M
