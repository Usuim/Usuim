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

" Commenter (alacritty - gnome-terminal)
inoremap <C-_> <c-o>:CommentToggle<CR>
nnoremap <C-_> :CommentToggle<CR>
vnoremap <C-_> :'<,'>CommentToggle<CR>

" Commenter (kitty - xterm)
inoremap <C-7> <c-o>:CommentToggle<CR>
nnoremap <C-7> :CommentToggle<CR>
vnoremap <C-7> :'<,'>CommentToggle<CR>

" Ctrl + X and Shift + Del for cut
vnoremap <silent> <C-X> x:call ClipboardYank()<cr>
vnoremap <silent> <S-Del> x:call ClipboardYank()<cr>

nnoremap <silent> <C-X> dd:call ClipboardYank()<cr>
inoremap <silent> <C-X> <c-o>dd<c-o>:call ClipboardYank()<cr>

" Ctrl + C and Ctrl + Insert for Copy
vnoremap <silent> <C-C> y:call ClipboardYank()<cr>gv
vnoremap <silent> <C-Insert> y:call ClipboardYank()<cr>

nnoremap <silent> <C-C> yy:call ClipboardYank()<cr>
inoremap <silent> <C-C> <c-o>yy<c-o>:call ClipboardYank()<cr>


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

" Contextual Menu
nnoremap <RightMouse> <cmd>:popup Usuim<CR>
inoremap <RightMouse> <cmd>:popup Usuim<CR>
vnoremap <RightMouse> <cmd>:popup VUsuim<CR>

nnoremap <C-Q> <cmd>:lua closeBuffer(vim.api.nvim_get_current_buf())<CR>
inoremap <C-Q> <cmd>:lua closeBuffer(vim.api.nvim_get_current_buf())<CR>

" Hover
" autocmd CursorHoldI * :lua HoverFixed()

" Renamer
nnoremap <C-R> :lua require('renamer').rename()<CR>
inoremap <C-R> <c-o>:lua require('renamer').rename()<CR>

" Bufferline next/prev
nnoremap <C-PageDown> :BufferLineCycleNext<CR>
inoremap <C-PageDown> <c-o>:BufferLineCycleNext<CR>

nnoremap <C-PageUp> :BufferLineCyclePrev<CR>
inoremap <C-PageUp> <c-o>:BufferLineCyclePrev<CR>

" Bufferline move tab
nnoremap <C-ScrollWheelUp> :BufferLineMoveNext<CR>
inoremap <C-ScrollWheelUp> <c-o>:BufferLineMoveNext<CR>

nnoremap <C-ScrollWheelDown> :BufferLineMovePrev<CR>
inoremap <C-ScrollWheelDown> <c-o>:BufferLineMovePrev<CR>
