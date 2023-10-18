local M = {}

M.config = function()
    -- Generic LSP settings
    lvim.lsp.installer.setup.automatic_installation = true
    lvim.lsp.installer.setup.ensure_installed = {"gopls", "lua_ls"},

    -- Linters
    local linters = require "lvim.lsp.null-ls.linters"
    linters.setup({
        { command = "golangci_lint",                                                        filetypes = { "go" } },
        { filetypes = { "sh" },                                                             command = "shellcheck" },
        { filetypes = { "python" },                                                         command = "pylint" },
        { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "eslint" },
        { filetypes = { "html" },                                                           command = "tidy" },
        { filetypes = { "css" },                                                            command = "stylelint" },
        {
            filetypes = { "markdown" },
            command = "markdownlint",
            args = {
                "--disable", "MD013" }
        },
    })

    -- Formatters
    lvim.format_on_save = { enabled = true, pattern = "*", timeout = 2000 }
    -- set a formatter, this will override the language server formatting capabilities
    -- (if it exists)
    local formatters = require "lvim.lsp.null-ls.formatters"
    formatters.setup {
        { command = "gofumpt",     filetypes = { "go" } },
        { command = "goimports",   filetypes = { "go" } },
        { filetypes = { "sh" },    command = "shfmt",       extra_args = { "-i", "2" } },
        { filetypes = { "cmake" }, command = "cmake_format" },
        {
            filetypes = { "python" },
            command = "yapf",
            args = { "--style={based_on_style: google, column_limit: 120, indent_width: 4}" }
        },
        { filetypes = { "lua" },                                                            command = "stylua" },
        { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "prettier" },
        { filetypes = { "html", "css", "markdown" },                                        command = "prettier" },
    }
end

return M
