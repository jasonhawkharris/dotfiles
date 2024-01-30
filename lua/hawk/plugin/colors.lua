---@diagnostic disable: undefined-global
-- [ ] Themes I Like:
-- [x] "rose-pine"
-- [ ] "everforest"
-- [ ] "space-duck"
-- [ ] "onedark"

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "@keyword", { bg = "none", fg = "#56b6c2", bold = true })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3C3836" })
end

ColorMyPencils()
