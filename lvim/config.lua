--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "vscode"
vim.g.vscode_style = "dark"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ";"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<Leader>n"] = ":noh<cr>"
lvim.keys.normal_mode["<Leader>gp"] = ":Glow<cr>"
lvim.keys.normal_mode["gd"] = "<cmd>lua vim.lsp.buf.definition()<cr>"
lvim.keys.normal_mode["gk"] = "<cmd>lua vim.lsp.buf.hover()<cr>"
lvim.keys.normal_mode["gi"] = "<cmd>lua vim.lsp.buf.implementation()<cr>"
lvim.keys.normal_mode["gr"] = "<cmd>lua vim.lsp.buf.references()<cr>"
lvim.keys.normal_mode["gp"] = "<cmd>lua require'lvim.lsp.peek'.Peek('definition')<CR>"
lvim.keys.normal_mode["<C-j>"] = "<cmd>lua vim.diagnostic.goto_next()<cr>"
lvim.keys.normal_mode["<space>f"] = "<cmd>lua vim.lsp.buf.formatting()<cr>"
lvim.keys.normal_mode["<Leader>a"] = "<cmd>lua vim.lsp.buf.code_action()<cr>"
lvim.keys.insert_mode["<C-e>"] = "<cmd>lua require'luasnip'.jump(1)<cr>"
lvim.keys.insert_mode["<C-w>"] = "<cmd>lua require'luasnip'.jump(-1)<cr>"
lvim.keys.insert_mode["<C-n>"] = "<cmd>lua require'luasnip'.change_choice(1)<cr>"
lvim.keys.insert_mode["<C-p>"] = "<cmd>lua require'luasnip'.change_choice(-1)<cr>"
vim.cmd([[
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <C-t> <C-O>

au BufNewFile,BufRead *.todo setf todo 
]])

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "markdown",
  "go",
  "html",
  "vue",
  "scala",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
--local formatters = require "lvim.lsp.null-ls.formatters"
--formatters.setup {
--  {
--    command = "autopep8", filetypes = { "python" },
--    extra_args = { "--in-place" },
--  }

--}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--  { command = "flake8", filetypes = { "python" } },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
lvim.plugins = {
  {
    "scalameta/nvim-metals",
    ft = {"scala", "sbt"},
    -- config = function()
    --   require("user.metals").config()
    -- end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  { "Mofiqul/vscode.nvim" },
  { "ollykel/v-vim", ft = {"vlang"} },
  { "vim-denops/denops.vim" },
  { "zakinomiya/nvim-dictionary" },
  { "haishanh/night-owl.vim" },
  { "sainnhe/edge" },
}

lvim.autocommands.custom_groups = {
  { "FileType", "scala,sbt", "lua require('user.metals').config()" },
}
lvim.builtin.terminal.execs = { { "tig", "<Leader>gg", "Tig", "float" } }
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.nvimtree.setup.view.width = 100

require("luasnip.loaders.from_lua").load({ paths = { "~/.config/lvim/snippets/" } })

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.vlang = {
  install_info = {
    url = "https://github.com/zakinomiya/tree-sitter-v", -- local path or git repo
    -- files = { "src/parser.c", "src/scanner.c" },
    files = { "src/parser.c", "src/scanner.c" },
    -- optional entries:
    -- branch = "main", -- default branch in case of git repo if different from master
    -- generate_requires_npm = true, -- if stand-alone parser without npm dependencies
    -- requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = "vlang", -- if filetype does not match the parser name
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
