local M = {}

M.config = function()
    lvim.builtin.treesitter.ignore_install = { "haskell" }
    lvim.builtin.treesitter.highlight.enable = true
    lvim.builtin.treesitter.ensure_installed = {
        "bash",
        "c",
        "json",
        "yaml",
        "toml",
        "comment",
        "markdown",
        "lua",
        "python",
        "tsx",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "rust",
        "java",
        "go",
        "gomod",
        "gowork",
        "regex",
        "dockerfile",
    }
end

return M
