local M = {}

M.config = function()
    lvim.builtin.terminal.active = true
    lvim.builtin.terminal.open_mapping = [[<C-\>]]
    lvim.builtin.terminal.execs[1] = { vim.o.shell, "<C-`>", "Horizontal Terminal", "horizontal", 0.3 }
    -- To map jk to exit terminal-mode:
    --   :tnoremap jk <C-\><C-n>
    -- You can see :help terminal
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
end

return M
