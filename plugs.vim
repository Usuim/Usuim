"VIMPLUG

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Install Plugs

call plug#begin()

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sbdchd/neoformat'
Plug 'terrortylor/nvim-comment'
Plug 'norcalli/nvim-colorizer.lua'

" Themes
Plug 'navarasu/onedark.nvim'
Plug 'xiyaowong/nvim-transparent'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Navbar
Plug 'romgrk/barbar.nvim'

" Tree
Plug 'kyazdani42/nvim-tree.lua'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

"Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
" LSP-AUTOCOMPLETION
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
" CMP-SNIPPET
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"Terminal
Plug 'SrWither/toggleterm.nvim'

" Test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

"IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

"CRATES
Plug 'nvim-lua/plenary.nvim'
Plug 'saecki/crates.nvim'
Plug 'cespare/vim-toml'

" Dashboard
Plug 'SrWither/dashboard-nvim'
Plug 'liuchengxu/vim-clap'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" popup
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-lua/popup.nvim'

call plug#end()
