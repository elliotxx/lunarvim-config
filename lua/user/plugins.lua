local M = {}

M.config = function()
    -- Additional Plugins
    lvim.plugins = {
        -- trouble.nvim
        -- diagnostics, references, telescope results, quickfix and location lists
        {
            "folke/trouble.nvim",
            cmd = "TroubleToggle",
        },

        -- auto-save.nvim (https://github.com/Pocco81/auto-save.nvim)
        -- automatically saving your work whenever you make changes to it
        -- {
        --     "Pocco81/auto-save.nvim",
        --     cmd = "ASToggle", -- optional for lazy loading on command
        --     config = function()
        --         require("auto-save").setup {
        --             trigger_events = { "BufLeave" },
        --             debounce_delay = 1000, -- saves the file at most every `debounce_delay` milliseconds
        --         }
        --     end,
        -- },

        -- auto-save.nvim is a lua plugin for automatically saving your changed buffers in Neovim
        -- Forked from auto-save.nvim as active development has stopped
        {
            "okuuva/auto-save.nvim",
            cmd = "ASToggle", -- optional for lazy loading on command
            -- event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
            opts = {
                -- your config goes here
                -- or just leave it empty :)
                -- enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
                execution_message = {
                    enabled = true,
                    message = function() -- message to print on save
                        return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                    end,
                    dim = 0.18,                                    -- dim the color of `message`
                    cleaning_interval = 1250,                      -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
                },
                trigger_events = {                                 -- See :h events
                    immediate_save = { "BufLeave", "FocusLost" },  -- vim events that trigger an immediate save
                    defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
                    cancel_defered_save = { "InsertEnter" },       -- vim events that cancel a pending deferred save
                },
                -- function that takes the buffer handle and determines whether to save the current buffer or not
                -- return true: if buffer is ok to be saved
                -- return false: if it's not ok to be saved
                -- if set to `nil` then no specific condition is applied
                condition = nil,
                write_all_buffers = false, -- write all buffers when the current one meets `condition`
                noautocmd = false,         -- do not execute autocmds when saving
                debounce_delay = 1000,     -- delay after which a pending save is executed
                -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
                debug = false,
            },
        },

        -- symbols-outline.nvim
        {
            "simrat39/symbols-outline.nvim",
            config = function()
                require('symbols-outline').setup()
            end
        },

        -- markdown-preview.nvim
        {
            "iamcco/markdown-preview.nvim",
            build = "cd app && npm install",
            ft = "markdown",
            lazy = true,
            config = function()
                vim.g.mkdp_auto_close = true
                vim.g.mkdp_open_to_the_world = false
                vim.g.mkdp_open_ip = "127.0.0.1"
                vim.g.mkdp_port = "8888"
                vim.g.mkdp_browser = ""
                vim.g.mkdp_echo_preview_url = true
                vim.g.mkdp_page_title = "${name}"
            end,
        },

        -- diffview.nvim
        {
            "sindrets/diffview.nvim",
            event = "BufRead",
            config = function()
                require("diffview").setup {
                    keymaps = {
                        disable_defaults = false, -- Disable the default keymaps
                        view = {
                            -- Disable the default normal mode mapping
                            ["<leader>e"] = false,
                            ["<leader>b"] = false,
                        },
                        file_panel = {
                            { "n", "<cr>", require("diffview.actions").goto_file_tab,
                                { desc = "Open the file in a new tabpage" } },
                            { "n", "o", require("diffview.actions").goto_file_tab,
                                { desc = "Open the file in a new tabpage" } },
                        }
                    }
                }
            end
        },

        -- nvim-spectre for replace
        {
            "windwp/nvim-spectre",
            event = "BufRead",
            config = function()
                require("spectre").setup()
            end,
        },

        -- fzf for search
        { 'junegunn/fzf',    build = ":call fzf#install()" },
        { 'junegunn/fzf.vim' },

        -- Colorschemes
        {
            "Mofiqul/dracula.nvim",
            config = function()
                require("dracula").setup {
                    -- use transparent background
                    transparent_bg = true,        -- default false
                    -- set custom lualine background color
                    lualine_bg_color = "#44475a", -- default nil
                    -- set italic comment
                    italic_comment = true,        -- default false
                }
            end
        },
        { "catppuccin/nvim",          name = "catppuccin" },
        { "svrana/neosolarized.nvim", name = "neosolarized" },
        { "folke/tokyonight.nvim",    name = "tokyonight" },

        -- -- glepnir/lspsaga.nvim
        -- {
        --     "glepnir/lspsaga.nvim",
        --     branch = "main",
        --     config = function()
        --         require("lspsaga").setup {
        --             ui = {
        --                 -- This option only works in Neovim 0.9
        --                 title = false,
        --             },
        --         }
        --     end,
        --     dependencies = {
        --         { "nvim-tree/nvim-web-devicons" },
        --         --Please make sure you install markdown and markdown_inline parser
        --         { "nvim-treesitter/nvim-treesitter" }
        -- },

        -- j-hui/fidget.nvim. Standalone UI for nvim-lsp progress.
        {
            "j-hui/fidget.nvim",
            version = "legacy",
            event = "LspAttach",
        },

        -- ThePrimeagen/refactoring.nvim
        -- Support for various common refactoring operations
        {
            "ThePrimeagen/refactoring.nvim",
            config = function()
                require('refactoring').setup({
                    prompt_func_return_type = {
                        go = true,
                        java = false,

                        cpp = false,
                        c = false,
                        h = false,
                        hpp = false,
                        cxx = false,
                    },
                    prompt_func_param_type = {
                        go = true,
                        java = false,

                        cpp = false,
                        c = false,
                        h = false,
                        hpp = false,
                        cxx = false,
                    },
                    printf_statements = {},
                    print_var_statements = {},
                })
            end,
            dependencies = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-treesitter/nvim-treesitter" }
            },
        },

        -- stevearc/dressing.nvim
        -- Neovim plugin to improve the default vim.ui interfaces
        -- { "stevearc/dressing.nvim" },

        -- text-case.nvim
        -- Enter `ga` to jump to which-key
        {
            "johmsalas/text-case.nvim",
            config = function()
                require('textcase').setup {}
            end
        },

        -- folke/todo-comments.nvim
        -- todo-comments is a lua plugin for Neovim 0.5 to highlight and search for todo comments like TODO, HACK, BUG in your code base.
        {
            "folke/todo-comments.nvim",
            config = function()
                require('todo-comments').setup {}
            end,
            dependencies = {
                { "nvim-lua/plenary.nvim" },
            },
        },

        -- The goal of nvim-ufo is to make Neovim's fold look modern and keep high performance.
        {
            "kevinhwang91/nvim-ufo",
            dependencies = "kevinhwang91/promise-async"
        },

        -- folke/flash.nvim
        -- flash.nvim lets you navigate your code with search labels, enhanced character motions, and Treesitter integration.
        {
            "folke/flash.nvim",
            event = "VeryLazy",
            opts = {},
            keys = {
                {
                    "s",
                    mode = { "n", "x", "o" },
                    function() require("flash").jump() end,
                    desc = "Flash"
                },
                {
                    "S",
                    mode = { "n", "o", "x" },
                    function() require("flash").treesitter() end,
                    desc =
                    "Flash Treesitter"
                },
                {
                    "r",
                    mode = "o",
                    function() require("flash").remote() end,
                    desc =
                    "Remote Flash"
                },
                {
                    "R",
                    mode = { "o", "x" },
                    function() require("flash").treesitter_search() end,
                    desc =
                    "Treesitter Search"
                },
                {
                    "<c-s>",
                    mode = { "c" },
                    function() require("flash").toggle() end,
                    desc =
                    "Toggle Flash Search"
                },
            },
        },

        {"soulis-1256/hoverhints.nvim"},
    }
end

return M
