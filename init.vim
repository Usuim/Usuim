runtime plugs.vim
runtime mapping.vim
runtime config.vim
runtime lsp.vim
runtime dashboard.vim

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
set guifont=Fira\ Code:h11
set mouse=a

" Themes
colorscheme onedark
let g:airline_theme='onedark'

" NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif

