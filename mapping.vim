let mapleader=" "

" Terminal
"nnoremap <C-j> <c-w>j
"nnoremap <C-k> <c-w>k
"tnoremap <esc> <c-\><c-n>
"nnoremap <c-t> :split<CR>:ter<CR>:resize 12<CR>
nnoremap <c-t> :ToggleTerm size=10<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)


" Paste
vnoremap <c-v> "+p

" Save
nnoremap <c-s> :w!<CR>

"Tmux
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

" Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" NerdCommenter
map <C-F7> <Plug>NERDCommenterToggle

" Telescope
nnoremap <C-f> <cmd>Telescope live_grep<cr>
