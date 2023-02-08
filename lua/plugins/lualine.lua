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

local theme = function()
      local colors = {
          darkgray = "#16161d",
          gray = "#727169",
          innerbg = nil,
          outerbg = "#16161D",
          normal = "#7e9cd8",
          insert = "#98bb6c",
          visual = "#ffa066",
          replace = "#e46876",
          command = "#e6c384",
      }
      return {
          inactive = {
              a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
              b = { fg = colors.gray, bg = colors.outerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
          },
          visual = {
              a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
              b = { fg = colors.gray, bg = colors.outerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
          },
          replace = {
              a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
              b = { fg = colors.gray, bg = colors.outerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
          },
          normal = {
              a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
              b = { fg = colors.gray, bg = colors.outerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
          },
          insert = {
              a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
              b = { fg = colors.gray, bg = colors.outerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
          },
          command = {
              a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
              b = { fg = colors.gray, bg = colors.outerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
          },
      }
  end

require("lualine").setup({
  options = {
      theme = theme(),
  },
})
