return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-t>",
          next = "<C-q>",
          prev = "<C-a>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
        go = true,
        c = false,
      },
    },
  },
  -- These are some examples, uncomment them if you want to see them worm k!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "gopls",
      },
    },
  },
  {
    "rhysd/vim-go-impl",
    lazy = true,
    ft = "go",
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    ft = "go",
    config = function() end,
  },
  {
    "leoluz/nvim-dap-go",
    lazy = true,
    ft = "go",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    ft = "go",
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    ft = "go",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "vim-test/vim-test",
    lazy = false,
  },
}
