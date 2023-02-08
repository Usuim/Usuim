lua<<EOF

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- To add a langserver for example:

-- require('lspconfig')['clangd'].setup {
--   capabilities = capabilities
-- }

  require('lspconfig')['intelephense'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities
  }

-- vim.api.nvim_create_autocmd("CursorHold", {
--   buffer = bufnr,
--   callback = function()
--     local opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = 'rounded',
--       source = 'always',
--       prefix = ' ',
--       scope = 'cursor',
--     }
--     vim.diagnostic.open_float(nil, opts)
--   end
-- })
--
-- vim.api.nvim_create_autocmd("CursorHoldI", {
--   buffer = bufnr,
--   callback = function()
--     local opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = 'rounded',
--       source = 'always',
--       prefix = ' ',
--       scope = 'cursor',
--     }
--     vim.diagnostic.open_float(nil, opts)
--   end
-- })

EOF
