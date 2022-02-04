" Python
let g:python3_host_prog="python3.8"

" Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set foldlevelstart=99

" Termguicolors
set termguicolors

" CloseTag

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,vue'

" Lua config
lua <<EOF
-- Treesitter
require'nvim-treesitter.configs'.setup {
  ignore_install = { "norg" },
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

-- NvimComment-Treesitter
require("nvim_comment").setup({
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})

-- Transparent.nvim
require("transparent").setup({
  enable = false, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be clear
    -- In particular, when you set it to 'all', that means all avaliable groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

-- NvimComment Setup
require('nvim_comment').setup()

-- Colorizer
require 'colorizer'.setup {
  css = { css = true; };
  html = {
    mode = 'background';
  }
}

-- Bufferline
function closeBuffer(bfname)
  local treeView = require('nvim-tree.view')
  local bufferline = require('bufferline')
  local currentBuffer = vim.fn.expand('%')

  local explorerWindow = treeView.get_winnr()
  local wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)

  if currentBuffer == "Term" then
    vim.cmd 'exe "normal \\<C-W>k"'
  elseif currentBuffer == "NvimTree" then
    vim.cmd 'exe "normal \\<C-W>l"'
  else
    print("a")
  end

  local bufferToDelete = vim.api.nvim_get_current_buf()

  if (wasExplorerOpen) then
    if (bufferToDelete ~= bfname) then
      print("delete")
    else
      bufferline.cycle(-1)
    end
  end

  vim.cmd('bdelete! ' .. bfname)
end

function openBuffer(bfname)
  local currentBuffer = vim.fn.expand('%')
  if currentBuffer == "Term" then
    vim.cmd 'exe "normal \\<C-W>k"'
    vim.cmd("buffer" .. bfname)
  else
    vim.cmd("buffer" .. bfname)
  end
end

require('bufferline').setup {
  options = {
    close_command = "lua closeBuffer(%d)",
    right_mouse_command = "lua closeBuffer(%d)",
    left_mouse_command = "lua openBuffer(%d)",
    middle_mouse_command = nil,
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or " " )
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end,
        highlight = "Directory",
        text_align = "center"
      }
    },
    show_buffer_icons = true ,
    show_buffer_close_icons = true ,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
}

-- Autopairs
require('nvim-autopairs').setup{}

-- Crates
require('crates').setup()

-- Refactoring
require('refactoring').setup({})
require("telescope").load_extension("refactoring")
vim.api.nvim_set_keymap(
  "v",
  "<C-r>",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)
-- Trim
require('trim').setup({
  disable = {},
  patterns = {
    [[%s/\s\+$//e]],
    [[%s/\($\n\s*\)\+\%$//]],
    [[%s/\%^\n\+//]],
    [[%s/\(\n\n\)\n\+/\1/]],
  },
})
EOF
