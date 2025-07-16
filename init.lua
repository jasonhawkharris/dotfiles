require('hawk.lazy')
require('hawk')

-- LSP Setup with native Neovim 0.11+ LSP
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) }
    }
  }
}

vim.lsp.config['tsserver'] = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' }
}

vim.lsp.config['svelte'] = {
  cmd = { 'svelte-language-server', '--stdio' },
  filetypes = { 'svelte' }
}

vim.lsp.config['html'] = {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' }
}

vim.lsp.config['cssls'] = {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' }
}

vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' }
}

vim.lsp.config['jsonls'] = {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' }
}

vim.lsp.config['graphql'] = {
  cmd = { 'graphql-lsp', 'server', '-m', 'stream' },
  filetypes = { 'graphql', 'typescriptreact', 'javascriptreact' }
}

-- Set up LSP keymaps on attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buffer = args.buf
    
    -- Buffer local mappings
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = buffer, desc = 'Go to definition' })
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { buffer = buffer, desc = 'Go to references' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = buffer, desc = 'Hover documentation' })
    vim.keymap.set('n', 'E', vim.diagnostic.open_float, { buffer = buffer, desc = 'Show diagnostics' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = buffer, desc = 'Rename symbol' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = buffer, desc = 'Code actions' })
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { buffer = buffer, desc = 'Format buffer' })
  end,
})

-- Enable the language servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('tsserver')
vim.lsp.enable('svelte')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('gopls')
vim.lsp.enable('jsonls')
vim.lsp.enable('graphql')

