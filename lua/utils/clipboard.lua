function ClipboardYank()
  vim.cmd("call system(\"echo'\". @@,\"' | xsel -i -b\")")
end

function ClipboardPaste()
  vim.cmd("let @@ = system('xsel -o -b')")
end
