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
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'norcalli/nvim-colorizer.lua'

" Themes
Plug 'Mofiqul/vscode.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'xiyaowong/nvim-transparent'

" Lualine
Plug 'nvim-lualine/lualine.nvim'
Plug 'SmiteshP/nvim-gps'

"Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Navbar
Plug 'akinsho/bufferline.nvim'

" Tree
Plug 'SrWither/nvim-tree.lua'

" Typing
Plug 'windwp/nvim-autopairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
" LSP-AUTOCOMPLETION
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
" LUASNIP
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

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
Plug 'nvim-telescope/telescope.nvim', { 'tag' : 'nvim-0.6' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

"CRATES
Plug 'nvim-lua/plenary.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'v0.2.0' }
Plug 'cespare/vim-toml'

" Dashboard
Plug 'SrWither/dashboard-nvim'
Plug 'liuchengxu/vim-clap'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" popup
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-lua/popup.nvim'

" Refactoring
Plug 'ThePrimeagen/refactoring.nvim'

" Search/Replace
Plug 'MunifTanjim/nui.nvim'
Plug 'SrWither/searchbox.nvim'

" Todo-comment
Plug 'folke/todo-comments.nvim'

" Trim
Plug 'cappyzawa/trim.nvim'

" Workspaces
Plug 'natecraddock/workspaces.nvim'

" External Plugins
runtime ../vsvim/plugins.vim

call plug#end()
