---@diagnostic disable: undefined-global
local function cmd(command)
    return table.concat({ '<Cmd>', command, '<CR>' })
end

-- Explore when not using nvim-tree.nvim
--" vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move shit around all nice
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep search terms in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>c", cmd 'set colorcolumn=0')
vim.keymap.set("n", "<leader>C", cmd 'set colorcolumn=90')

-- For vertical MaStErY
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- For Cody
vim.keymap.set("n", "<leader>cc", cmd 'CodyToggle')
vim.keymap.set("v", "<leader>ca", cmd 'CodyAsk')

-- For exiting vim
vim.keymap.set("n", "<C-[>", cmd 'q!')

-- For opening file tree
vim.keymap.set('n', '<leader>pv', cmd 'NvimTreeToggle')

-- Gitsigns
vim.keymap.set('n', '<leader>ts', cmd 'Gitsigns toggle_signs')
vim.keymap.set('n', '<leader>tb', cmd 'Gitsigns toggle_current_line_blame')

-- Telescope
vim.keymap.set('n', '<leader>sf', cmd 'Telescope find_files')
vim.keymap.set('n', '<leader>sh', cmd 'Telescope help_tags')
vim.keymap.set('n', '<leader>sw', cmd 'Telescope grep_string')
vim.keymap.set('n', '<leader>sg', cmd 'Telescope live_grep')
vim.keymap.set('n', '<leader>sd', cmd 'Telescope diagnostics')
vim.keymap.set('n', '<leader>gs', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

--- Harpoon
local harpoon = require('harpoon')
vim.keymap.set("n", "<leader>mm", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>vv", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
vim.keymap.set("n", "<leader>0", function() harpoon:list():select(0) end)
