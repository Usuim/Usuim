vim.api.nvim_command("filetype plugin on")
vim.api.nvim_command("syntax enable")

vim.opt.encoding = "UTF-8"
vim.opt.clipboard="unnamedplus"
vim.opt.swapfile = false
vim.opt.scrolloff = 12
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.fileformat="unix"
vim.opt.mouse="a"
vim.opt.keymodel= {"startsel","stopsel" }
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true
vim.opt.updatetime=2000
vim.opt.termguicolors=true
vim.opt.guifont="DroidSansMono Nerd Font:h11"
vim.opt.number = true
vim.opt.splitbelow = true
