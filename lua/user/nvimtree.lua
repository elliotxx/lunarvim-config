local M = {}

M.config = function()
    lvim.builtin.nvimtree.setup.view.side = "left"
    lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
    lvim.builtin.nvimtree.setup.auto_reload_on_write = true
    lvim.builtin.nvimtree.setup.git.ignore = true
end

return M
