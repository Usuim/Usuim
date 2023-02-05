" Normal - Insert
:amenu 90.100 Usuim.Go\ to\ Definition <cmd>:lua vim.lsp.buf.definition()<CR>
:amenu 90.100 Usuim.Go\ to\ Type\ Definition <cmd>:lua vim.lsp.buf.type_definition()<CR>
:amenu 90.100 Usuim.Go\ to\ Implementations <cmd>:Telescope lsp_implementations<CR>
:amenu 90.100 Usuim.Go\ to\ References <cmd>:Telescope lsp_references<CR>
:amenu 90.100 Usuim.View\ > <cmd>:popup ViewMenu<CR>
:amenu 90.100 Usuim.-1- *
:amenu 90.100 Usuim.Rename\ Definition <cmd>:lua require('renamer').rename()<CR>
:amenu 90.100 Usuim.Code\ Actions <cmd>:lua require('telescope').extensions.code_actions.code_actions()<CR>
:amenu 90.100 Usuim.-2- *

" Copy/Cut/Paste
:imenu 90.100 Usuim.Copy <C-C>
:nmenu 90.100 Usuim.Copy <C-C>
:imenu 90.100 Usuim.Cut <C-X>
:nmenu 90.100 Usuim.Cut <C-X>
:imenu 90.100 Usuim.Paste <C-V>
:nmenu 90.100 Usuim.Paste <C-V>

:amenu 90.100 Usuim.-3- *
" Format Document
:amenu 90.100 Usuim.Format\ Document <cmd>:Neoformat<CR>

" Visual
:vmenu 90.110 VUsuim.Copy "+y
:vmenu 90.110 VUsuim.Cut "+x
:vmenu 90.110 VUsuim.Paste <C-V>
:amenu 90.110 VUsuim.-1- *
:vmenu 90.110 VUsuim.Delete "_d

:imenu 90.110 VUsuim.Copy "+y
:imenu 90.110 VUsuim.Cut "+x
:imenu 90.110 VUsuim.Paste <C-V>
:imenu 90.110 VUsuim.Delete "_dd

" View Menu
:amenu 100.100 ViewMenu.Go\ to\ Preview\ Definition <cmd>:lua require('goto-preview').goto_preview_definition()<CR>
:amenu 100.100 ViewMenu.Go\ to\ Preview\ Type\ Definition <cmd>:lua require('goto-preview').goto_preview_type_definition()<CR>
:amenu 100.100 ViewMenu.Go\ to\ Preview\ Implementations <cmd>:lua require('goto-preview').goto_preview_implementation()<CR>
:amenu 100.100 ViewMenu.Go\ to\ Preview\ References <cmd>:lua require('goto-preview').goto_preview_references()<CR>
