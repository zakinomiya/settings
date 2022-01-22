call plug#begin(stdpath('data') . '/plugged')

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'folke/tokyonight.nvim'
  Plug 'ray-x/lsp_signature.nvim'

  " code analysis and highlighting
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " fuzzy finder 
  Plug 'nvim-telescope/telescope.nvim'

  " neovim utils
  Plug 'nvim-lua/plenary.nvim'

  " icons and colors
  Plug 'nvim-lua/popup.nvim'
  Plug 'tomasiser/vim-code-dark'

  " julia 
  Plug 'JuliaEditorSupport/julia-vim'

  " lua
  Plug 'nvim-lualine/lualine.nvim'

  " snippets
  Plug 'sirver/ultisnips'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'onsails/lspkind-nvim'

  " nvim-cmp
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-path'
  Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
  Plug 'kristijanhusak/vim-dadbod-completion' 
  Plug 'windwp/nvim-autopairs'

call plug#end()
