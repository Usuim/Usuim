<h1 align="center">:wrench: Using external configuration</h1>

#### You can add your own neovim config without it being removed when upgrading Usuim. 
#### the configuration is located in: `~/.config/usuim`

##### inside there are 6 files

<details>
  <summary>commands.vim</summary>

```vim
" Go to definition
command! GoToDef lua vim.lsp.buf.definition()
```
</details>

<details>
  <summary>lsp.vim</summary>
  
```vim

lua<<EOF

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- To add a langserver for example:

-- require('lspconfig')['clangd'].setup {
--   capabilities = capabilities
-- }

EOF
```
  </details>
  
 <details>
   <summary>mapping.vim</summary>

```vim
" Example:
"nnoremap <C-b> :Telescope find_files cwd=.<cr>
"inoremap <C-b> <ESC>:Telescope find_files cwd=.<cr>
```
</details>
   
<details>
   <summary>plugins.vim</summary>

```lua
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
```
</details>
  
<details>
   <summary>plugins/presence.vim</summary>
  
```lua

lua << EOF
-- RPC
require("presence"):setup({
    workspace_text = function(git_project_name, buffer)
        local project_name = git_project_name
        if not git_project_name then
            project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end

        return string.format("Workspace: %s", project_name)
    end,
})
EOF
```
</details>
   
<details>
  <summary>settings.vim</summary>

```vim
" this setting can be changed and will not be overridden by an update
" to disable any parameter you must comment the line

" To import files:
" source $HOME/.config/usuim/file.vim

" Autoinsert mode
autocmd BufRead,BufNewFile,BufEnter * set formatoptions-=cro | start

" Themes
colorscheme vscode

" Editor Settings
set termguicolors
set guifont=Fira\ Code:h12
set number
set splitbelow

" CloseTag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,vue'
```
</details>

   
## Example
   
### for example if you like the relative number in neovim you can activate it here
`settings.vim`
 
```vim
" Editor Settings
set relativenumber " add/uncomment this line
```
<kbd>
  <img src="https://user-images.githubusercontent.com/59105868/184548218-0ac11ec5-47bb-4488-b3fa-e8b82b1832a1.png">
</kbd>
   
## Discord Rich Presence (Beta)

### if you want it to appear on discord that you are using Usuim. you must uncomment:
`plugins.vim`

```lua
-- Discord RPC
{
 'Usuim/presence.nvim',
  config = function ()
    vim.cmd('source $HOME/.config/usuim/plugins/presence.vim')
  end
},
```
#### And then run on the neovim command line: `:Lazy sync`
   
<kbd>
  <img src="https://user-images.githubusercontent.com/59105868/217693003-db65362b-b48d-4929-a0f1-01dc4d93b724.png">
</kbd>

#### ⚠️ Usuim Rich Presence is currently in beta. _Some programming languages may not have icons._
   
## Add language server

##### For example if I want autocomplete in **Dart**

##### I must add this:

`lsp.vim`
   
```lua
-- Dart
require('lspconfig')['dartls'].setup {
  capabilities = capabilities
}
```

<kbd>
  <img src="https://user-images.githubusercontent.com/59105868/184723805-29101317-a8ce-46ef-bf59-faccd4364f52.png">
</kbd>

#### look <a href="https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md">here</a> for more information
