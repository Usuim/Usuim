" LSP

syntax enable

filetype plugin indent on

set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua <<EOF

-- nvim_lsp

-- Rust
local rust_lsp = require'lspconfig'
-- Python
local python_lsp = require'lspconfig'
-- C/Cpp
local clangd_lsp = require'lspconfig'
-- JS/TSS
local tss_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Iniciar Langservers

-- Start Rust-Analyzer
rust_lsp.rust_analyzer.setup({ on_attach=on_attach })
-- Start Pyright
python_lsp.pyright.setup({on_attach=on_attach})
-- Start Clangd
clangd_lsp.clangd.setup({on_attach=on_attach})
-- Start tsserver
tss_lsp.tsserver.setup({on_attach=on_attach})


-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- Web Develop

local lsp_config = require("lspconfig")
local lsp_completion = require("completion")

--Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local general_on_attach = function(client, bufnr)
  if client.resolved_capabilities.completion then
    lsp_completion.on_attach(client, bufnr)
  end
end

-- Setup basic lsp servers
for _, server in pairs({"html", "cssls"}) do
  lsp_config[server].setup {
    -- Add capabilities
    capabilities = capabilities,
    on_attach = general_on_attach
  }
end

EOF
