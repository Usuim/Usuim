" Import Config Files
runtime plugs.vim
runtime config.vim
runtime lsp.vim
runtime cmp.vim
runtime functions.vim
runtime mapping.vim
runtime tree.vim
runtime dashboard.vim
runtime todo.vim
runtime telescope.vim

" Set Configuration
let HOME = system('echo $HOME')

filetype plugin on
set encoding=UTF-8
set clipboard+=unnamedplus
syntax enable
set noswapfile
set scrolloff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set mouse=a
set keymodel=startsel,stopsel
set tabstop=2 shiftwidth=2 expandtab
set updatetime=2000
let g:vscode_style = "dark"
colorscheme vscode

source $HOME/.config/vsvim/settings.vim
source $HOME/.config/vsvim/config.vim
source $HOME/.config/vsvim/lsp.vim
source $HOME/.config/vsvim/commands.vim
source $HOME/.config/vsvim/mapping.vim

" AutoChangeMode
autocmd BufEnter,BufNew,VimEnter NvimTree stopinsert
autocmd BufEnter,BufNew Dashboard stopinsert
autocmd BufEnter,BufNew,TermOpen Term :call Term()
