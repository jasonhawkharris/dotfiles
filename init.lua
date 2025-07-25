require('hawk.lazy')
require('hawk')

-- LSP Setup with native Neovim 0.11+ LSP
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_dir = vim.fs.root(0, { '.luarc.json', '.luarc.jsonc', '.git' }),
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
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  root_dir = vim.fs.root(0, { 'package.json', 'tsconfig.json', '.git' })
}

vim.lsp.config['svelte'] = {
  cmd = { 'svelte-language-server', '--stdio' },
  filetypes = { 'svelte' },
  root_dir = vim.fs.root(0, { 'svelte.config.js', 'package.json', '.git' })
}

vim.lsp.config['html'] = {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' },
  root_dir = vim.fs.root(0, { 'package.json', '.git' })
}

vim.lsp.config['cssls'] = {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  root_dir = vim.fs.root(0, { 'package.json', '.git' })
}

vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = vim.fs.root(0, { 'go.mod', 'go.work', '.git' })
}

vim.lsp.config['jsonls'] = {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  root_dir = vim.fs.root(0, { 'package.json', '.git' })
}

vim.lsp.config['graphql'] = {
  cmd = { 'graphql-lsp', 'server', '-m', 'stream' },
  filetypes = { 'graphql', 'typescriptreact', 'javascriptreact' },
  root_dir = vim.fs.root(0, { 'package.json', '.graphqlrc', '.git' })
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
    vim.keymap.set('n', '<leader>fo', function() vim.lsp.buf.format { async = true } end, { buffer = buffer, desc = 'Format buffer' })
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

