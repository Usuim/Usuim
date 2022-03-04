" Search
inoremap <C-f> <ESC>:SearchBoxMatchAll title="Search"<cr>
nnoremap <C-f> :SearchBoxMatchAll title="Search"<cr>
xnoremap <C-f> :SearchBoxMatchAll title="Search" visual_mode=true <cr>

" Replace
inoremap <c-l> <ESC>:SearchBoxReplace confirm=native<CR>
nnoremap <c-l> :SearchBoxReplace confirm=native<CR>
vnoremap <c-l> :SearchBoxReplace confirm=native<CR>

" Telescope
nnoremap <C-b> :Telescope find_files cwd=.<cr>
inoremap <C-b> <ESC>:Telescope find_files cwd=.<cr>

" Open dashboard
nnoremap <F3> :Dashboard <CR>

" Go to definition
nnoremap <C-F12> :GoToDef<CR>
inoremap <C-F12> <ESC>:GoToDef<CR>
