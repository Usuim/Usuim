" Python
let g:python3_host_prog="python3.8"

" Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set foldlevelstart=99

" Termguicolors
set termguicolors

" Lua config
lua <<EOF
-- Treesitter
require'nvim-treesitter.configs'.setup {
  ignore_install = { "norg" },
  ensure_installed = "all",
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

-- NvimComment Setup
require('nvim_comment').setup()

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
  elseif currentBuffer == "NvimTree" then
    vim.cmd 'exe "normal \\<C-W>l"'
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
    indicator_icon = '',
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
        -- highlight = "Directory",
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
  },
}

-- Autopairs
require('nvim-autopairs').setup{}

-- Crates
require('crates').setup()

-- Trim
require('trim').setup({
  disable = {},
  patterns = {
    [[%s/\s\+$//e]],
    [[%s/\($\n\s*\)\+\%$//]],
    [[%s/\%^\n\+//]],
    -- [[%s/\(\n\n\)\n\+/\1/]],
  },
})

-- Workspaces
require("workspaces").setup()
require('telescope').load_extension("workspaces")

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
    {
      'filename',
      file_status = true,
      path = 1,
      shorting_target = 40,
      symbols = {
        modified = '[+]',
        readonly = '[-]',
        unnamed = '[No Name]',
      }
    }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree', 'toggleterm'}
}

EOF
