"VIMPLUG

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Install Plugs

call plug#begin()
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
" LSP-AUTOCOMPLETION
Plug 'nvim-lua/completion-nvim'
" THEME
Plug 'drewtempelmeyer/palenight.vim'
"NERDTREE
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
"COLORS
Plug 'norcalli/nvim-colorizer.lua'
"AIRLINE-ICONS
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
"TERMINAL
Plug 'akinsho/nvim-toggleterm.lua'
"AUTOPAIRS
Plug 'jiangmiao/auto-pairs'
"TELESCOPE
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
"AUTOPAIRS
Plug 'jiangmiao/auto-pairs'
"LANG-SYNTAX
Plug 'cespare/vim-toml'
"CRATES
Plug 'saecki/crates.nvim'
call plug#end()
