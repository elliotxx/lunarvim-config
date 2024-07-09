local M = {}

M.config = function()
    -- Use which-key to add extra bindings with the leader-key prefix
    lvim.builtin.which_key.setup.plugins.marks = true
    lvim.builtin.which_key.setup.plugins.presets = {
        operators = true,    -- adds help for operators like d, y, ...
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
    }
    lvim.builtin.which_key.vmappings = {
        ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle" },

        R = {
            name = "Refactor",
            -- r = { "<cmd>lua require('refactoring').select_refactor()<CR>", "Refactor prompt" },
            r = { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactor Prompt" },
            v = { "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
            i = { "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
            f = { "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
            F = { "<Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
                "Extract Function To File" },
        },

        u = {
            name = "Utils",
            c = { "<Esc><cmd>'<,'>CodeSnap<cr>", "Save selected code snapshot into clipboard" },
            a = { "<Esc><cmd>'<,'>CodeSnapASCII<cr>", "Save selected code snapshot in ASCII into clipboard" },
        }
    }

    lvim.builtin.which_key.mappings = {
        [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
        ["w"] = { "<cmd>w!<CR>", "Save" },
        ["q"] = { "<cmd>confirm q<CR>", "Quit" },
        ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle" },
        ["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
        -- ["f"] = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" },
        -- Reference: https://github.com/junegunn/fzf#respecting-gitignore
        -- ["f"] = {
        --     function()
        --         require("lvim.core.telescope.custom-finders").find_project_files { previewer = false }
        --     end,
        --     "Find File",
        -- },
        ["f"] = {
            "<cmd>let $FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git' | Files<CR>",
            "Find File"
        },
        ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
        ["o"] = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" },
        ["p"] = { "<cmd>Telescope projects<cr>", "Projects" },
        ["e"] = { "<cmd>Neotree toggle<CR>", "Explorer" },
        ["E"] = { "<cmd>lua MiniFiles.open()<CR>", "MiniFiles Explorer" },

        b = {
            name = "Buffers",
            f = { "<cmd>Telescope buffers<cr>", "Find buffers" },
            j = { "<cmd>BufferLineCycleNext<cr>", "Next" },
            k = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
            e = {
                "<cmd>BufferLinePickClose<cr>",
                "Pick which buffer to close",
            },
            h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
            a = { "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>", "Close all buffers" },
            l = {
                "<cmd>BufferLineCloseRight<cr>",
                "Close all to the right",
            },
            D = {
                "<cmd>BufferLineSortByDirectory<cr>",
                "Sort by directory",
            },
            L = {
                "<cmd>BufferLineSortByExtension<cr>",
                "Sort by language",
            },
        },

        d = {
            name = "Debug",
            t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
            b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
            c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
            C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
            d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
            g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
            i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
            o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
            u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
            p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
            r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
            s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
            q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
            U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
        },

        P = {
            name = "Plugins",
            i = { "<cmd>Lazy install<cr>", "Install" },
            s = { "<cmd>Lazy sync<cr>", "Sync" },
            S = { "<cmd>Lazy clear<cr>", "Status" },
            c = { "<cmd>Lazy clean<cr>", "Clean" },
            u = { "<cmd>Lazy update<cr>", "Update" },
            p = { "<cmd>Lazy profile<cr>", "Profile" },
            l = { "<cmd>Lazy log<cr>", "Log" },
            d = { "<cmd>Lazy debug<cr>", "Debug" },
        },

        -- " Available Debug Adapters:
        -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
        -- " Adapter configuration and installation instructions:
        -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        -- " Debug Adapter protocol:
        -- "   https://microsoft.github.io/debug-adapter-protocol/
        -- " Debugging
        g = {
            name = "Git",
            g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
            -- g = { "<cmd>DiffviewOpen<cr>", "Git Diffview" },
            h = { "<cmd>DiffviewFileHistory<cr>", "Project Git History" },
            f = { "<cmd>Telescope git_status<cr>", "Find changed file" },
            F = { "<cmd>DiffviewFileHistory %<cr>", "File Git History" },
            j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
            k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
            l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
            p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
            r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
            R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
            s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
            u = {
                "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                "Undo Stage Hunk",
            },
            b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
            C = {
                "<cmd>Telescope git_bcommits<cr>",
                "Checkout commit(for current file)",
            },
            d = {
                "<cmd>Gitsigns diffthis HEAD<cr>",
                "Git Diff",
            },
        },

        l = {
            name = "LSP",
            a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
            c = { "<cmd>Lspsaga incoming_calls<cr>", "Call hierarchy" },
            d = { "<cmd>Lspsaga goto_definition<cr>", "Goto Definition" },
            p = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
            P = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek Type Definition" },
            f = { "<cmd>Lspsaga finder tyd+ref+imp+def<cr>", "Find references and implementation" },
            F = { require("lvim.lsp.utils").format, "Format" },
            r = { "<cmd>Lspsaga rename<cr>", "Rename" },
            i = { "<cmd>LspInfo<cr>", "Info" },
            I = { "<cmd>Mason<cr>", "Mason Info" },
            l = { vim.lsp.codelens.run, "CodeLens Action" },
            q = { vim.diagnostic.setloclist, "Quickfix" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
            S = {
                "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                "Workspace Symbols",
            },
            e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
            R = { "<cmd>LspRestart<cr>", "Lsp Restart" },
        },

        L = {
            name = "+LunarVim",
            c = {
                "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
                "Edit config.lua",
            },
            f = {
                "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
                "Find LunarVim files",
            },
            g = {
                "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
                "Grep LunarVim files",
            },
            k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
            i = {
                "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
                "Toggle LunarVim Info",
            },
            I = {
                "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
                "View LunarVim's changelog",
            },
            l = {
                name = "+logs",
                d = {
                    "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
                    "view default log",
                },
                D = {
                    "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
                    "Open the default logfile",
                },
                l = {
                    "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
                    "view lsp log",
                },
                L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
                n = {
                    "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
                    "view neovim log",
                },
                N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
                p = {
                    "<cmd>lua require('lvim.core.terminal').toggle_log_view(get_cache_dir() .. '/packer.nvim.log')<cr>",
                    "view packer log",
                },
                P = { "<cmd>edit $LUNARVIM_CACHE_DIR/packer.nvim.log<cr>", "Open the Packer logfile" },
            },
            r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
            u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
        },

        R = {
            name = "Refactor",
            i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
            b = { "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block" },
            B = { "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract Block To File" },
            s = { "<cmd>WordSwitch<CR>", "Word Switch" },
        },

        s = {
            name = "Search",
            b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            c = { "<cmd>Colors<cr>", "Colorschemes" },
            C = { "<cmd>Telescope commands<cr>", "Commands" },
            -- Reference: https://github.com/junegunn/fzf#respecting-gitignore
            f = {
                "<cmd>let $FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git' | Files<cr>",
                "Find File" },
            h = { "<cmd>History<cr>", "History" },
            H = { "<cmd>Helptags<cr>", "Help tags" },
            m = { "<cmd>Marks<cr>", "Marks" },
            -- M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            R = { "<cmd>Telescope registers<cr>", "Registers" },
            g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
            k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
            p = {
                "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
                "Colorscheme with Preview",
            },
        },

        t = {
            name = "Diagnostics",
            -- d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
            -- w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
            t = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "trouble" },
            p = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "project" },
            f = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "document" },
            q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
            l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
            j = {
                vim.diagnostic.goto_next,
                "Next Diagnostic",
            },
            k = {
                vim.diagnostic.goto_prev,
                "Prev Diagnostic",
            },
        },

        T = {
            name = "Treesitter",
            i = { ":TSConfigInfo<cr>", "Info" },
        },

        r = {
            name = "Replace",
            f = { "<cmd>lua require('spectre').open_file_search()<CR>", "Replace File" },
            p = { "<cmd>lua require('spectre').open()<CR>", "Replace Project" },
            s = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search" },
            -- f = { "<cmd>lua require('grug-far').grug_far({ prefills = { flags = vim.fn.expand('%') } })<CR>", "Replace File" },
            -- p = { "<cmd>lua require('grug-far').grug_far()<CR>", "Replace Project" },
            -- w = { "<cmd>lua require('grug-far').grug_far({ prefills = { search = vim.fn.expand('<cword>') } })<CR>", "Search with current word" },
        },

        u = {
            name = "Utils",
            m = { "<cmd>MarkdownPreview<cr>", "MarkdownPreview" },
        }
    }
end

return M
