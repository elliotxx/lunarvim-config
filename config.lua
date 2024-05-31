--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- General
require("user.neovim").config()

-- Neovide
require("user.neovide").config()

-- Keymappings [view all the defaults by pressing <leader>Lk]
require("user.keybindings").config()

-- Telescope
require("user.telescope").config()

-- Indentlines
require("user.indentlines").config()

-- Alpha
require("user.alpha").config()

-- Terminal
require("user.terminal").config()

-- Treesitter
require("user.treesitter").config()

-- Lsp
require("user.lsp").config()

-- Which-key
require("user.which_key").config()

-- Additional Plugins
require("user.plugins").config()
