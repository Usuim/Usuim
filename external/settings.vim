" this setting can be changed and will not be overridden by an update
" to disable any parameter you must comment the line

" To import files:
" source $HOME/.config/vsvim/file.vim

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
