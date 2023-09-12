local M = {}

M.config = function()
    -- unmap a default keymapping
    -- vim.keymap.del("n", "<C-Up>")
    -- override a default keymapping
    -- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
    lvim.leader = "space"
    -- add your own keymapping
    lvim.keys.normal_mode["<D-s>"] = ":w<cr>"
    lvim.keys.normal_mode["|"] = ":vsplit<CR>"
    lvim.keys.normal_mode["-"] = ":split<CR>"
    -- fast movement
    lvim.lsp.buffer_mappings.normal_mode["K"] = nil
    lvim.lsp.buffer_mappings.normal_mode["C-K"] = nil
    lvim.lsp.buffer_mappings.normal_mode["<S-C-K>"] = { vim.lsp.buf.hover, "Show hover" }
    lvim.keys.normal_mode["J"] = "5j"
    lvim.keys.normal_mode["K"] = "5k"
    lvim.keys.normal_mode["H"] = "5h"
    lvim.keys.normal_mode["L"] = "5l"
    -- config for nvim-ufo
    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
end

return M
