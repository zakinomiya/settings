nnoremap <silent> <Leader>f <cmd>Telescope find_files<cr>
nnoremap <silent> <Leader>r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> <Leader><Leader> <cmd>Telescope help_tags<cr>
nnoremap <silent> <Leader>k <cmd>Telescope keymaps<cr>
nnoremap <silent> <Leader>gc <cmd>Telescope git_commits<cr>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    wimblend = 0,
  }
}
EOF
