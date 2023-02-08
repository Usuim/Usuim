lua << EOF
-- Use lazy to add plugins

UserPlugins = {
  -- Discord RPC
  -- {
  --   'Usuim/presence.nvim',
  --   config = function ()
  --     vim.cmd('source $HOME/.config/usuim/plugins/presence.vim')
  --   end
  -- },
  -- VsCode theme
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
    end,
  },
  -- One Dark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
          style = 'dark'
      }
    end,
  },
}

EOF
