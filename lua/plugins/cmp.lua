  -- Setup nvim-cmp.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require('cmp')
local lspkind = require('lspkind')
local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

-- icons
local kind_icons = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
  TabNine = "󰹻"
}

-- Setup CMP

cmp.setup({
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      -- Source
      vim_item.menu = ({
        buffer = "",
        nvim_lsp = "",
        luasnip = "",
        nvim_lua = "",
        cmp_tabnine = "",
        latex_symbols = "",
     })[entry.source.name]
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-ScrollWheelUp>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-ScrollWheelDown>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        fallback()
      end
    end,

    ['<Down>'] = function(fallback)
      if not cmp.select_next_item() then
        fallback()
      end
    end,

    ['<ScrollWheelDown>'] = function(fallback)
      if not cmp.select_next_item() then
        fallback()
      end
    end,

  ['<S-Tab>'] = function(fallback)
    if not cmp.select_prev_item() then
      fallback()
    end
  end,

  ['<ScrollWheelUp>'] = function(fallback)
    if not cmp.select_prev_item() then
      fallback()
    end
  end,

  ['<Up>'] = function(fallback)
    if not cmp.select_prev_item() then
      fallback()
    end
  end,

  ['<ESC>'] = function(fallback)
    if cmp.visible() then
      cmp.close()
    else
      fallback()
    end
  end,

  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = "crates" },
    { name = 'nvim_lsp_signature_help' },
    { name = 'cmp_tabnine' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' }
  }, {
    { name = 'buffer' }
  })
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- The attach function I use in require('mason-lspconfig').setup_handlers
local on_attach = function(client, buf)
    -- Enable inlay hints if the client supports it.
    if client.server_capabilities.inlayHintProvider then
        local inlay_hints_group = vim.api.nvim_create_augroup('InlayHints', { clear = true })

        -- Initial inlay hint display.
        local mode = vim.api.nvim_get_mode().mode
        vim.lsp.inlay_hint(buf, mode == 'n' or mode == 'v')

        vim.api.nvim_create_autocmd('InsertEnter', {
            group = inlay_hints_group,
            buffer = buf,
            callback = function()
                vim.lsp.inlay_hint(buf, true)
            end,
        })
        vim.api.nvim_create_autocmd('InsertLeave', {
            group = inlay_hints_group,
            buffer = buf,
            callback = function()
                -- vim.lsp.inlay_hint(buf, true)
            end,
        })
    end
end
-- Rust
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}
-- Python
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}
-- C/C++
require('lspconfig')['clangd'].setup {
  capabilities = capabilities,
}
-- Tsserver
require('lspconfig')['tsserver'].setup {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim"
  },
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
  single_file_support = true,
  root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  on_attach = on_attach
}
-- Vue
require('lspconfig')['vuels'].setup {
  capabilities = capabilities
}
-- Html
require('lspconfig')['html'].setup {
  capabilities = capabilities
}
-- Css
require('lspconfig')['cssls'].setup {
  capabilities = capabilities
}
-- Golang
require('lspconfig')['gopls'].setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl" },
  single_file_support = true
}
-- CMake
require('lspconfig')['cmake'].setup {
  capabilities = capabilities
}
-- Eslint
require('lspconfig')['eslint'].setup {
  capabilities = capabilities
}
-- Json
require('lspconfig')['jsonls'].setup {
  capabilities = capabilities
}
-- Assembly
require('lspconfig')['asm_lsp'].setup {
  capabilities = capabilities,
  root_dir = require("lspconfig").util.root_pattern{"*"}
}
-- Bash
require('lspconfig')['bashls'].setup {
  capabilities = capabilities
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = {
        'html',
        'css',
        'scss',
        'javascriptreact',
        'typescriptreact',
        'haml',
        'xml',
        'xsl',
        'pug',
        'slim',
        'sass',
        'stylus',
        'less',
        'sss',
        'hbs',
        'handlebars',
      };
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

lspconfig.ls_emmet.setup { capabilities = capabilities }

-- Setup vscode snippets
require("luasnip.loaders.from_vscode").lazy_load()
