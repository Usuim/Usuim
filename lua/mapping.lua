local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Clipboard functions
require("utils.clipboard")

-- Terminal
map("n", "<c-t>", ":<C-u>silent! :ToggleTerm size=10<CR>", { silent = true })
map("i", "<c-t>", "<c-o>:<C-u>silent! :ToggleTerm size=10<CR>", { silent = true })

-- NvimTree
map("n", "<F2>", "<CMD>:NvimTreeToggle<CR>")
map("i", "<F2>", "<CMD>:NvimTreeToggle<CR>")

-- Ctrl+Delete
map("i", "<C-BS>", "<C-w>")
map("i", "<C-h>", "<C-w>")

-- Close buffer
map("n", "<C-Q>", "<cmd>:lua closeBuffer(vim.api.nvim_get_current_buf())<CR>")
map("i", "<C-Q>", "<cmd>:lua closeBuffer(vim.api.nvim_get_current_buf())<CR>")

-- Clipboard Copy
map("v", "<C-C>", "y:lua ClipboardYank()<cr>gv", {silent = true} )
map("n", "<C-C>", "yy:lua ClipboardYank()<cr>", {silent = true})
map("i", "<C-C>", "<c-o>yy<c-o>:lua ClipboardYank()<cr>", {silent = true})

-- Clipboard Cut
map("v", "<C-X>", "x:lua ClipboardYank()<cr>gv", {silent = true} )
map("n", "<C-X>", "dd:lua ClipboardYank()<cr>", {silent = true})
map("i", "<C-X>", "<c-o>dd<c-o>:lua ClipboardYank()<cr>", {silent = true})

-- Clipboard Paste
map("", "<C-V>", ":lua ClipboardPaste()<cr>p", {silent = true})
map("c", "<C-V>", "<C-R>+")
vim.cmd("exe 'inoremap <script> <C-V>' paste#paste_cmd['i']")
vim.cmd("exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']")

-- Undo
map("n", "<C-Z>", ":u<CR>")
map("i", "<C-Z>", "<c-o>:u<CR>")
map("v", "<C-Z>", "<ESC> :u<CR>")

-- Redo
map("n", "<C-Y>", ":redo<CR>")
map("i", "<C-Y>", "<c-o>:redo<CR>")
map("v", "<C-Y>", "<ESC> :redo<CR>")

-- Select all
map("n", "<C-A>", "ggVG", {silent = true})
map("i", "<C-A>", "<c-o>gg<c-o>VG<cr>", {silent = true})

-- Save
map("n", "<C-S>", [[:retab | :w!<CR>]])
map("i", "<C-S>", [[<c-o>:retab | :w!<CR>]])

-- Move Selection
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- Delete in election mode
map("v", "<BS>", [["_d]])

-- Delete without save in the clipboard
map("n", "<C-K>", [["_dd]])
map("i", "<C-K>", [[<c-o>"_dd]])
map("v", "<C-K>", [["_d]])

-- Bufferline next/prev
map("n", "<C-PageDown>", ":BufferLineCycleNext<CR>")
map("i", "<C-PageDown>", "<c-o>:BufferLineCycleNext<CR>")

map("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>")
map("i", "<C-PageUp>", "<c-o>:BufferLineCyclePrev<CR>")

-- Bufferline move tab
map("n", "<C-ScrollWheelUp>", ":BufferLineMoveNext<CR>")
map("i", "<C-ScrollWheelUp>", "<c-o>:BufferLineMoveNext<CR>")

map("n", "<C-ScrollWheelDown>", ":BufferLineMovePrev<CR>")
map("i", "<C-ScrollWheelDown>", "<c-o>:BufferLineMovePrev<CR>")

-- Contextual Menu
map("n", "<RightMouse>", "<cmd>:popup Usuim<CR>")
map("i", "<RightMouse>", "<cmd>:popup Usuim<CR>")
map("v", "<RightMouse>", "<cmd>:popup VUsuim<CR>")

-- Commenter (alacritty - gnome-terminal)
map("n", "<C-_>", ":CommentToggle<CR>")
map("i", "<C-_>", "<c-o>:CommentToggle<CR>")
map("v", "<C-_>", ":'<,'>CommentToggle<CR>")

-- Commenter (kitty - xterm)
map("n", "<C-7>", ":CommentToggle<CR>")
map("i", "<C-7>", "<c-o>:CommentToggle<CR>")
map("v", "<C-7>", ":'<,'>CommentToggle<CR>")
