lua <<EOF
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
  TypeParameter = '  ',}

-- Setup CMP

  cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
        -- Source
        vim_item.menu = ({
          buffer = "",
          nvim_lsp = "",
          luasnip = "",
          nvim_lua = "",
          latex_symbols = "",
       })[entry.source.name]
        return vim_item
      end
    },
    snippet = {
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
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

    ['<S-Tab>'] = function(fallback)
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
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Rust
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
  }
  -- Python
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  -- C/C++
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
  -- Tsserver
  require('lspconfig')['tsserver'].setup {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    root_dir = require("lspconfig").util.root_pattern("*")
    -- root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
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
    root_dir = require("lspconfig").util.root_pattern{"*"},
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
EOF
