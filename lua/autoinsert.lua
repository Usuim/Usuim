function Term()
  vim.cmd("stopinsert | nnoremap <buffer><LeftRelease> <LeftRelease>i")
end

vim.api.nvim_command("autocmd BufEnter,BufNew Dashboard stopinsert")
vim.api.nvim_command("autocmd BufEnter,BufNew,VimEnter NvimTree stopinsert")
vim.api.nvim_command("autocmd BufEnter,BufNew,TermOpen Term :lua Term()")
vim.api.nvim_command("autocmd TermOpen * :lua Term()")
