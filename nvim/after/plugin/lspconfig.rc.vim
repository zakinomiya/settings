au filetype python nnoremap <space>f <cmd>call Autopep8()<CR>

" autopep8
function! Autopep8() range
  execute  "0,$!" 'autopep8' . ' -'
endfunction

