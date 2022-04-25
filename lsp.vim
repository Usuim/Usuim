" LSP

syntax enable

filetype plugin indent on

set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua <<EOF
  -- setup nvim-lsp
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {update_in_insert = true})

  -- Hover Config
  function HoverFixed()
    vim.api.nvim_command('set eventignore=CursorHold')
    vim.lsp.buf.hover()
    vim.api.nvim_command('autocmd CursorMoved <buffer> ++once set eventignore=""')
  end

      vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler

EOF
