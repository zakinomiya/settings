vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.undofile = true
vim.o.winborder = "rounded"

vim.g.mapleader = ";"

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>n", ":noh<CR>")
vim.keymap.set("t", "<C-j><C-k>", "<C-\\><C-n><C-w>h")

vim.pack.add({
	{ src = "https://github.com/Mofiqul/vscode.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/coder/claudecode.nvim" }
})

require("snacks").setup {
	indent = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	statuscolumn = { enabled = true },
	zen = { enabled = true },
}
vim.keymap.set("n", "<leader>e", ":lua Snacks.explorer()<CR>", { silent = true} )
vim.keymap.set("n", "<leader>ff", ":lua Snacks.picker.files()<CR>", { silent = true} )
vim.keymap.set("n", "<leader>bf", ":lua Snacks.picker.buffers()<CR>", { silent = true} )
vim.keymap.set("n", "<leader>gf", ":lua Snacks.picker.grep()<CR>", { silent = true} )
vim.keymap.set("n", "<leader>z", ":lua Snacks.zen()<CR>", { silent = true} )

require("claudecode").setup {
	terminal_cmd = "~/.claude/local/claude"
}
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>")

vim.lsp.enable({
	"lua_ls",
	"gopls"
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)

vim.cmd("colorscheme vscode")
vim.cmd(":hi statusline guibg=NONE")

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		vim.cmd("TSEnable highlight")
	end,
})
