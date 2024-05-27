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

        -- Allow clipboard copy paste in neovide
        -- Reference: https://neovide.dev/faq.html?highlight=paste#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
        vim.keymap.set('n', '<D-s>', ':w<CR>')          -- Save
        vim.keymap.set('v', '<D-c>', '"+y')             -- Copy
        vim.keymap.set('n', '<D-v>', '"+P')             -- Paste normal mode
        vim.keymap.set('v', '<D-v>', '"+P')             -- Paste visual mode
        vim.keymap.set('c', '<D-v>', '<C-R>+')          -- Paste command mode
        -- vim.keymap.set('i', '<D-v>', '<ESC>"+Pi')       -- Paste insert mode
        vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')     -- Paste insert mode
        vim.keymap.set('t', '<D-v>', '<C-\\><C-n>"+Pi') -- Paste terminal mode

        vim.opt.title = true
        vim.opt.cursorline = false
        vim.opt.cursorcolumn = false

        vim.g.neovide_remember_window_size = true
        vim.g.neovide_remember_window_position = true
        vim.g.neovide_remember_dimensions = true
        vim.g.neovide_input_use_logo = 1
        vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
        vim.g.neovide_refresh_rate = 65

        vim.g.transparency = 0.8
        vim.g.neovide_transparency = 0.8
        vim.g.neovide_window_blurred = true


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
