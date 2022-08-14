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
  <summary>config.vim</summary>

```vim
" CloseTag

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,vue'

lua<<EOF

-- Transparent.nvim
require("transparent").setup({
  enable = false,
  extra_groups = {

    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {},
})

-- Colorizer
require 'colorizer'.setup {
  css = { css = true; };
  html = {
    mode = 'background';
  }
}

-- Refactoring
require('refactoring').setup({})
require("telescope").load_extension("refactoring")
vim.api.nvim_set_keymap(
  "v",
  "<C-r>",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)

EOF
```
 </details>

<details>
  <summary>lsp.vim</summary>
  
```vim

lua<<EOF

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
" Search
inoremap <C-f> <ESC>:SearchBoxMatchAll title="Search"<cr>
nnoremap <C-f> :SearchBoxMatchAll title="Search"<cr>
xnoremap <C-f> :SearchBoxMatchAll title="Search" visual_mode=true <cr>

" Replace
inoremap <c-l> <ESC>:SearchBoxReplace confirm=native<CR>
nnoremap <c-l> :SearchBoxReplace confirm=native<CR>
vnoremap <c-l> :SearchBoxReplace confirm=native<CR>

" Telescope
nnoremap <C-b> :Telescope find_files cwd=.<cr>
inoremap <C-b> <ESC>:Telescope find_files cwd=.<cr>

" Open dashboard
nnoremap <F3> :Dashboard <CR>
```
</details>
   
<details>
   <summary>plugins.vim</summary>

```vim
" Nord Theme
Plug 'shaunsingh/nord.nvim'
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
colorscheme onedark

" Editor Settings
set termguicolors
set guifont=Fira\ Code:h12
set number
set splitbelow
" set relativenumber
```
</details>

   
## Example
   
#### if you like the relative number in neovim you can activate it here
`settings.vim`
 
```vim
" Editor Settings
set relativenumber " add/uncomment this line
```
<kbd>
  <img src="https://user-images.githubusercontent.com/59105868/184548218-0ac11ec5-47bb-4488-b3fa-e8b82b1832a1.png">
</kbd>
