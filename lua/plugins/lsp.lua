vim.opt.completeopt={"menuone", "noinsert", "noselect"}
vim.opt.shortmess="c"

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {update_in_insert = true})

vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
