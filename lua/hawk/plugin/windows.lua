---@diagnostic disable: undefined-global
local function cmd(command)
    return table.concat({
        '<Cmd>',
        command,
        '<CR>'
    })
end

require("windows").setup({
    vim.keymap.set('n', '<C-w>+', cmd 'WindowsMaximize'),
    vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically'),
    vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally'),
    vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize'),
})
