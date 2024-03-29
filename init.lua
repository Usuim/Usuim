vim.cmd("let HOME = '" .. vim.fn.expand('~') .. "'")

require('options')
require('plugin')
require('mapping')
require('contextmenu')

-- External Config
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/settings.vim"))
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/lsp.vim"))
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/commands.vim"))
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/mapping.vim"))

-- Colors
require('colors')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("autocmd BufRead,BufNewFile,BufEnter * set formatoptions-=cro | stopinsert")
