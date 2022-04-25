" Leader
let mapleader=" "

" Terminal
nnoremap <c-t> :<C-u>silent! :ToggleTerm size=10<CR>
inoremap <c-t> <c-o>:<C-u>silent! :ToggleTerm size=10<CR>

" Save
nnoremap <c-s> :retab \| :w!<CR>
inoremap <c-s> <c-o>:retab \| :w!<cr>

" Toggle NvimTree
inoremap <F2> <c-o>:NvimTreeToggle<CR>
nnoremap <F2> :NvimTreeToggle<CR>

" Commenter
inoremap <C-_> <c-o>:CommentToggle<CR>
nnoremap <C-_> :CommentToggle<CR>
vnoremap <C-_> :'<,'>CommentToggle<CR>

" Ctrl + X and Shift + Del for cut
vnoremap <silent> <C-X> x:call ClipboardYank()<cr>
vnoremap <silent> <S-Del> x:call ClipboardYank()<cr>

" Ctrl + C and Ctrl + Insert for Copy
vnoremap <silent> <C-C> y:call ClipboardYank()<cr>gv
vnoremap <silent> <C-Insert> y:call ClipboardYank()<cr>

" Ctrl + V and Shift + Insert for Paste
map <silent> <C-V> :call ClipboardPaste()<cr>p
map <silent> <S-Insert> :call ClipboardPaste()<cr>p

cmap <C-V>      <C-R>+
cmap <S-Insert>     <C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>

" Ctrl Z and Ctrl Y
nnoremap <c-z> :u<CR>
inoremap <c-z> <c-o>:u<CR>
vnoremap <c-z> <ESC> :u<CR>

nnoremap <c-y> :redo<CR>
inoremap <c-y> <c-o>:redo<CR>
vnoremap <c-y> <ESC> :redo<CR>

" Ctrl + A to select all
nnoremap <silent> <C-A> :echo "Select All"<cr>ggVG
inoremap <silent> <C-A> <c-o>gg<c-o>VG<cr>

" Move lines
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==

inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi

vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Tab selection
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Ctrlr + Delete
inoremap <C-BS> <C-w>
inoremap <C-h> <C-w>

" Delete without save in clipboard
nnoremap <c-k> "_dd
vnoremap <c-k> "_d
inoremap <c-k> <c-o>"_dd

" Delete in visual mode
vnoremap <BS> "_d

" Code Actions
nnoremap <RightMouse> <LeftMouse> :Telescope lsp_code_actions<CR>
inoremap <RightMouse> <c-o><LeftMouse><c-o>:Telescope lsp_code_actions<CR>

nnoremap <C-Q> :Telescope lsp_code_actions<CR>
inoremap <C-Q> <c-o>:Telescope lsp_code_actions<CR>

" Hover
" autocmd CursorHoldI * :lua HoverFixed()
