---@diagnostic disable: undefined-global
-- [ ] Themes I Like:
-- [ ] "rose-pine"
-- [ ] "everforest"
-- [ ] "space-duck"
-- [ ] "onedark"
-- [x] "gruvbox"

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "@keyword", { bg = "none", fg = "#7dcfff", bold = true })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#283457" })
end

ColorMyPencils()
