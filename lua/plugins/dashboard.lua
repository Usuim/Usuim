require('dashboard').setup {
  theme = 'doom',
  config = {
    header = {
      '',
      '',
      '██╗   ██╗███████╗██╗   ██╗██╗███╗   ███╗',
      '██║   ██║██╔════╝██║   ██║██║████╗ ████║',
      '██║   ██║███████╗██║   ██║██║██╔████╔██║',
      '██║   ██║╚════██║██║   ██║██║██║╚██╔╝██║',
      '╚██████╔╝███████║╚██████╔╝██║██║ ╚═╝ ██║',
      ' ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝╚═╝     ╚═╝',
      '',
      '',
    },
    center = {
      {
        icon = '  ',
        icon_hl = 'New',
        desc = 'New File',
        desc_hl = 'String',
        action = 'e newfile'
      },
      {
        icon = '  ',
        icon_hl = 'Recent',
        desc = 'Recents',
        desc_hl = 'String',
        action = 'Telescope oldfiles'
      },
      {
        icon = '  ',
        icon_hl = 'Workspace',
        desc = 'Workspaces',
        desc_hl = 'String',
        action = 'Telescope workspaces'
      },
      {
        icon = '  ',
        icon_hl = 'Find',
        desc = 'Find File',
        desc_hl = 'String',
        action = 'Telescope find_files cwd=.'
      },
      {
        icon = '  ',
        icon_hl = 'Theme',
        desc = 'Color Scheme',
        desc_hl = 'String',
        action = 'Telescope colorscheme'
      },
      {
        icon = '  ',
        icon_hl = 'Update',
        desc = 'Update Plugins',
        desc_hl = 'String',
        action = 'Lazy sync'
      },
      {
        icon = '  ',
        icon_hl = 'Setting',
        desc = 'Settings',
        desc_hl = 'String',
        action = "lua vim.cmd('edit ' .. vim.fn.expand('~/.config/usuim/settings.vim'))"
      },
      {
        icon = '  ',
        icon_hl = 'Exit',
        desc = 'Exit',
        desc_hl = 'String',
        action = 'exit'
      }
    },
    footer = {
      '',
      '',
      'Usuim 1.9.0'
    }
  }
}
