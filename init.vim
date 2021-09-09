" Import Config

runtime plugs.vim
runtime mappings.vim
runtime lsp.vim
runtime vimspector.vim
runtime treesitter.vim


" Set Configuration

set encoding=UTF-8
set number
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
set guifont=Fira\ Code:h11

" Mapleader

let mapleader = ','

" Colorschemes

colorscheme palenight
let g:airline_theme='palenight'

" Termguicolors

if (has("termguicolors"))
	set termguicolors
endif

" Colorizer

lua require 'colorizer'.setup()
