local M = {}

M.config = function()
    -- Reference: https://github.com/akioito/dotfiles/blob/master/vim/.config/nvim/lua/configs.lua#L5-L28
    if vim.g.neovide then
        -- Poor performance after update to 0.10.3 #1634
        -- https://github.com/neovide/neovide/issues/1634#issuecomment-1315417301
        -- vim.g.neovide_refresh_rate = 30
        --
        -- Running set guifont=<font> causes the font to appear monospaced and not render properly.
        -- Reference: https://github.com/neovide/neovide/issues/1396
        vim.opt.guifont = ""

        -- Allow clipboard copy paste in neovim
        -- Reference: https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
        vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

        vim.g.neovide_remember_window_size = true
        vim.g.neovide_remember_window_position = true
        vim.g.neovide_remember_dimensions = true;
        vim.g.neovide_input_use_logo = 1
        vim.g.neovide_input_macos_alt_is_meta = true
        vim.g.neovide_transparency = 1
        vim.g.neovide_refresh_rate = 65
        vim.opt.title = true

        vim.api.nvim_command([[
            augroup Neovide
              autocmd BufWritePost * :wshada
            augroup END
        ]])

        -- Dynamically Change The Scale At Runtime
        -- Reference: https://neovide.dev/faq.html#how-can-i-dynamically-change-the-scale-at-runtime
        vim.g.neovide_scale_factor = 1.0
        local change_scale_factor = function(delta)
            vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
        end
        vim.keymap.set("n", "<D-=>", function()
            change_scale_factor(1.25)
        end)
        vim.keymap.set("n", "<D-->", function()
            change_scale_factor(1 / 1.25)
        end)
    end
end

return M
