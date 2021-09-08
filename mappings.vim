" MAPPING

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
nmap <c-w> :bd<CR>

" Telescope
nmap <F6> :Telescope find_files<CR>

" Terminal
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
tnoremap <esc> <c-\><c-n>
nnoremap <c-t> :split<CR>:ter<CR>:resize 12<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)
