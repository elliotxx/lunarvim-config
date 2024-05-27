local M = {}

M.config = function()
    lvim.builtin.terminal.active = true
    lvim.builtin.terminal.open_mapping = [[<C-\>]]
    lvim.builtin.terminal.execs[1] = { vim.o.shell, "<C-`>", "Horizontal Terminal", "horizontal", 0.3 }
    -- To map <Esc> to exit terminal-mode:
    --   :tnoremap <Esc> <C-\><C-n>
    -- You can see :help terminal
    vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]])
end

return M
