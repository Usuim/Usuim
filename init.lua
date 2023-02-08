require('options')
require('plugin')
require('mapping')
require('colors')
require('contextmenu')

-- External Config
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/settings.vim"))
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/config.vim"))
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/lsp.vim"))
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/commands.vim"))
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/mapping.vim"))

-- Autoinsert
require('autoinsert')
