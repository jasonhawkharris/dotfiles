require("autoclose").setup({
    keys = {
        ["'"] = { escape = true, close = false, pair = "''" },
        ["<"] = { escape = true, close = true, pair = "<>" },
    },
})
