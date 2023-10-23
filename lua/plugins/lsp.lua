vim.opt.completeopt={"menuone", "noinsert", "noselect"}
vim.opt.shortmess="c"

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {update_in_insert = true})

vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler

local lsputils = {
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    max_width = 80,
    max_height = 20,
    -- close_events = {
    --   "CursorMoved",
    --   "CursorMovedI",
    --   "BufHidden",
    --   "InsertCharPre",
    --   "WinLeave",
    --   "InsertEnter",
    --   "InsertLeave"
    -- },
  },
  diagnostic = {
    virtual_text = { spacing = 4, prefix = "●" },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
      "InsertEnter",
      "InsertLeave"
    },
  },
}

local diagnostic_signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

vim.diagnostic.config(lsputils.diagnostic)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsputils.float)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.documentHighlightProvider then
      local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", {})

      vim.opt.updatetime = 1000

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.document_highlight()
        end,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.clear_references()
        end,
      })
    end
  end,
})
