lua<<EOF

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- To add a langserver for example:

-- require('lspconfig')['clangd'].setup {
--   capabilities = capabilities
-- }

EOF
