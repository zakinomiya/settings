lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "scala"
    ,"javascript"
    ,"go"
    ,"bash"
    ,"tsx"
    ,"vue"
    ,"julia"
    ,"rust"
    ,"lua"
  },
  highlight = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF
