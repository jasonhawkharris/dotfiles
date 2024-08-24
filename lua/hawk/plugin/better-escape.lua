---@diagnostic disable: undefined-global
require("better_escape").setup {
    timeout = vim.o.timeoutlen,
    default_mappings = true,
    mappings = {
        i = {
            k = {
                -- These can all also be functions
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        c = {
            k = {
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        t = {
            k = {
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        v = {
            k = {
                j = "<Esc>",
            },
        },
        s = {
            k = {
                j = "<Esc>",
            },
        },
    },
}
