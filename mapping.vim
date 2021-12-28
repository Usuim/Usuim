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

" Save
nnoremap <c-s> :w!<CR>
inoremap <c-s> <c-o>:w!<cr>

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

" Open dashboard
nnoremap <F3> :Dashboard <CR>

" Visual Mode Settings

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction


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

" Ctrl + Q to enter Visual Mode
noremap <C-Q>       <C-V>

" Ctrl Z and Ctrl Y
nnoremap <c-z> :u<CR>
inoremap <c-z> <c-o>:u<CR>

nnoremap <c-y> <c-r><CR>
inoremap <c-y> <c-o><c-r><CR>

