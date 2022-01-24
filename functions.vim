" TermMode
function Term()
    stopinsert | nnoremap <buffer><LeftRelease> <LeftRelease>i
endfunction

" Visual Mode Settings
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" CloseWinConfirm
function CloseWin(msg)
    let l:answer = nr2char(getchar())

    if l:answer ==? 'a'
        :q!
    else
       :q!
    endif
endfunction
