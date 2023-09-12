local M = {}

M.config = function()
    lvim.log.level = "warn"
    lvim.colorscheme = "dracula"
    -- lvim.colorscheme = "catppuccin"
    -- lvim.colorscheme = "tokyonight-moon"
    -- lvim.colorscheme = "tokyonight-day"

    vim.opt.shiftwidth = 4  -- the number of spaces inserted for each indentation
    vim.opt.tabstop = 4     -- insert 2 spaces for a tab
    vim.opt.wrap = true     -- wrap lines
    vim.opt.textwidth = 80
    vim.opt.autoread = true -- auto reload files changed outside of vim

    --- config for nvim-ufo
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = "indent"
end

return M
