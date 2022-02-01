" Import Config Files
runtime plugs.vim
runtime config.vim
runtime lsp.vim
runtime functions.vim
runtime commands.vim
runtime mapping.vim
runtime tree.vim
runtime dashboard.vim
runtime todo.vim

" Set Configuration

filetype plugin on
set encoding=UTF-8
set number
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
set splitbelow
set termguicolors
set guifont=Fira\ Code:h12
set mouse=a
set keymodel=startsel,stopsel
set tabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile,BufEnter * start

" Themes
colorscheme onedark
let g:airline_theme='onedark'

" AutoChangeMode
autocmd BufEnter,BufNew,VimEnter NvimTree stopinsert
autocmd BufEnter,BufNew Dashboard stopinsert
autocmd BufEnter,BufNew,TermOpen Term :call Term()
