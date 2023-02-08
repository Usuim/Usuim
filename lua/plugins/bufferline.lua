function closeBuffer(bfname)
  local treeView = require('nvim-tree.view')
  local bufferline = require('bufferline')
  local currentBuffer = vim.fn.expand('%')

  local explorerWindow = treeView.get_winnr()
  local wasExplorerOpen = false

  if explorerWindow ~= nil then
    wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)
  end

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
    indicator = {
      style = 'icon',
      icon = '',
    },
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
