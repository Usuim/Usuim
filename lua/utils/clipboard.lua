function ClipboardYank()
  vim.cmd("call system('xclip -i -selection clipboard', @@)")
end
function ClipboardPaste()
  vim.cmd("let @@ = system('xclip -o -selection clipboard')")
end
