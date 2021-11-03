"  https://github.com/nvim-lualine/lualine.nvim
"  Lualine has sections as shown below.
" +-------------------------------------------------+
" | A | B | C                             X | Y | Z |
" +-------------------------------------------------+

lua <<EOF
local lualine = require('lualine').setup{
  options = {
    theme = 'codedark',
  },
}
EOF

