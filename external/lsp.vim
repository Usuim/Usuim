lua<<EOF

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- To add a langserver for example:

-- require('lspconfig')['clangd'].setup {
--   capabilities = capabilities
-- }

  require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities
  }

EOF
