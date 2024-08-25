---@diagnostic disable: undefined-global
local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'gopls',
        'rust_analyzer',
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>fo", function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("v", "<space>ca", vim.lsp.buf.code_action, opts)
    --[[ vim.api.nvim_buf_create_user_command(bufnr, 'fo', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' }) ]]
end)

-- lsp.setup()


---
--nvim comp
--
local cmp = require('cmp')
local cmp_format = lsp.cmp_format()
-- local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    formatting = cmp_format,
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = cmp.config.sources({
        { name = "cody" },
        { name = "nvim_lsp" }
    })

})
