vim.cmd([[aunmenu PopUp]])

-- Normal - Insert
vim.cmd([[:amenu 90.100 Usuim.Go\ to\ Definition <cmd>:lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 90.100 Usuim.Go\ to\ Type\ Definition <cmd>:lua vim.lsp.buf.type_definition()<CR>]])
vim.cmd([[:amenu 90.100 Usuim.Go\ to\ Implementations <cmd>:Telescope lsp_implementations<CR>]])
vim.cmd([[:amenu 90.100 Usuim.Go\ to\ References <cmd>:Telescope lsp_references<CR>]])
vim.cmd([[:amenu 90.100 Usuim.-1- *]])
vim.cmd([[:amenu 90.100 Usuim.Rename\ Definition <cmd>:lua require('renamer').rename()<CR>]])
vim.cmd([[:amenu 90.100 Usuim.Code\ Actions <cmd>:lua require('telescope').extensions.code_actions.code_actions()<CR>]])
vim.cmd([[:amenu 90.100 Usuim.-2- *]])

-- Colorpicker
vim.cmd([[:amenu 90.100 Usuim.Color\ Picker <cmd>:CccPick<CR>]])
vim.cmd([[:amenu 90.100 Usuim.Change\ Color\ Format <cmd>:CccConvert<CR>]])
vim.cmd([[:amenu 90.100 Usuim.-3- *]])

-- Copy/Cut/Paste
vim.cmd([[:imenu 90.100 Usuim.Copy <C-C>]])
vim.cmd([[:nmenu 90.100 Usuim.Copy <C-C>]])
vim.cmd([[:imenu 90.100 Usuim.Cut <C-X>]])
vim.cmd([[:nmenu 90.100 Usuim.Cut <C-X>]])
vim.cmd([[:imenu 90.100 Usuim.Paste <C-V>]])
vim.cmd([[:nmenu 90.100 Usuim.Paste <C-V>]])

vim.cmd([[:amenu 90.100 Usuim.-3- *]])
-- Format Document
vim.cmd([[:amenu 90.100 Usuim.Format\ Document <cmd>:Neoformat<CR>]])

-- Visual
vim.cmd([[:vmenu 90.110 VUsuim.Copy "+y]])
vim.cmd([[:vmenu 90.110 VUsuim.Cut "+x]])
vim.cmd([[:vmenu 90.110 VUsuim.Paste <C-V>]])
vim.cmd([[:amenu 90.110 VUsuim.-1- *]])
vim.cmd([[:vmenu 90.110 VUsuim.Delete "_d]])

vim.cmd([[:imenu 90.110 VUsuim.Copy "+y]])
vim.cmd([[:imenu 90.110 VUsuim.Cut "+x]])
vim.cmd([[:imenu 90.110 VUsuim.Paste <C-V>]])
vim.cmd([[:imenu 90.110 VUsuim.Delete "_dd]])
