call plug#begin(stdpath('data') . '/plugged')

  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'overcache/NeoSolarized'
  Plug 'rizzatti/dash.vim'
  Plug 'JuliaEditorSupport/julia-vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'sirver/ultisnips'

call plug#end()
