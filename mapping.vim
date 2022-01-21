" Leader
let mapleader=" "

" Terminal
nnoremap <c-t> :ToggleTerm size=10<CR>
inoremap <c-t> <c-o>:ToggleTerm size=10<CR>
"tnoremap <Esc> <C-\><C-n>

" Save
nnoremap <c-s> :retab \| :w!<CR>
inoremap <c-s> <c-o>:retab \| :w!<cr>

" Format
nnoremap <c-l> :Neoformat <cr>
inoremap <c-l> <c-o>:Neoformat \| :start <cr>

"Tmux
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

" Toggle NvimTree
inoremap <F2> <c-o>:NvimTreeToggle<CR>
nnoremap <F2> :NvimTreeToggle<CR>
" tnoremap <F2> <C-\><C-n>:NvimTreeToggle<CR>

" Commenter
inoremap <C-_> <c-o>:CommentToggle<CR>
nnoremap <C-_> :CommentToggle<CR>
vnoremap <C-_> :'<,'>CommentToggle<CR>

" Telescope
nnoremap <C-f> <cmd>Telescope live_grep<cr>
inoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope find_files cwd=.<cr>
inoremap <C-b> <cmd>Telescope find_files cwd=.<cr>
" nnoremap <C-b> <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>
" inoremap <C-b> <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>

" Open dashboard
nnoremap <F3> :Dashboard <CR>

" Ctrl + X and Shift + Del for cut
vnoremap <silent> <C-X> x:call ClipboardYank()<cr>
vnoremap <silent> <S-Del> x:call ClipboardYank()<cr>

" Ctrl + C and Ctrl + Insert for Copy
vnoremap <silent> <C-C> y:call ClipboardYank()<cr>
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

" Close Window
nnoremap <C-Q> :close<cr>
inoremap <C-Q> <c-o>:close<cr>

" Ctrl Z and Ctrl Y
nnoremap <c-z> :u<CR>
inoremap <c-z> <c-o>:u<CR>

nnoremap <c-y> :redo<CR>
inoremap <c-y> <c-o>:redo<CR>

" Ctrl + A to select all
map <silent> <C-A> :echo "Select All"<cr>ggVG
inoremap <silent> <C-A> <c-o>gg<c-o>VG<cr>
