local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
    b.formatting.lua_format.with {
        command = "lua-format",
        args = {
            "-i", "--no-keep-simple-function-one-line", "--no-break-after-operator",
            "--column-limit=100", "--break-after-table-lb"
        },
        filetypes = {"lua"}
    }, b.formatting.rubocop.with {
        command = "bundle",
        args = {
            "exec", "rubocop", "--auto-correct", "-f", "quiet", "--stderr", "--stdin", "$FILENAME"
        },
        filetypes = {"ruby"}
    }, b.diagnostics.rubocop.with {
        command = "bundle",
        args = {"exec", "rubocop", "-f", "json", "--stdin", "$FILENAME"},
        filetypes = {"ruby"}
    }, b.code_actions.gitsigns.with({disabled_filetypes = {"lua"}})
}

local M = {}

M.setup = function()
    null_ls.setup {debug = true, sources = sources, default_timeout = 50000, update_in_insert = true, debounce = 100}
end

return M
