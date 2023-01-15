" Normal - Insert
:amenu 90.100 Usuim.Go\ To\ Definition <cmd>:GoToDef<CR>
:amenu 90.100 Usuim.Rename\ Definition <cmd>:lua require('renamer').rename()<CR>
:amenu 90.100 Usuim.Code\ Actions <cmd>:lua require('telescope').extensions.code_actions.code_actions()<CR>
:amenu 90.100 Usuim.-1- *

" Paste
:imenu 90.100 Usuim.Paste <C-V>
:nmenu 90.100 Usuim.Paste <C-V>

:amenu 90.100 Usuim.-2- *
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
