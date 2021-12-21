if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '⛑',
  warn_sign = '☡',
  hint_sign = '⛱',
  infor_sign = 'ⓘ',
  border_style = "round",
}

EOF

nnoremap <silent> <C-j> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <Leader>gr :Lspsaga rename<CR>
nnoremap <silent> <Leader>d :Lspsaga preview_definition<CR>
nnoremap <silent> <Leader>t :Lspsaga open_floaterm<CR>
tnoremap <silent> <Leader>q <C-\><C-n>:Lspsaga close_floaterm<CR>

