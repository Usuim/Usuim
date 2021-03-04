" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

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

let mapleader = ','

call plug#begin()
" here you'll add all the plugins needed
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'zchee/deoplete-jedi'
Plug 'habamax/vim-godot'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

set background=dark
colorscheme palenight
let g:airline_theme='palenight'

if (has("termguicolors"))
	set termguicolors
endif

lua require 'colorizer'.setup()

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>

" Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode=':t'

nmap <F3> :bp<CR>
nmap <F4> :bn<CR>
nmap <F5> :bd<CR>

" Telescope
nmap <F6> :Telescope find_files<CR>
