---@diagnostic disable: undefined-global

local telescope = require('telescope')
local builtin = require('telescope.builtin')


require('telescope').setup({
    vim.keymap.set('n', '<leader>sf', builtin.find_files, {}),
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, {}),
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, {}),
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, {}),
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {}),
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {}),
})
