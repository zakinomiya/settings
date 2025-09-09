vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.undofile = true
vim.o.winborder = "rounded"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' }

vim.g.mapleader = ";"

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>w", ":write<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { silent = true })
vim.keymap.set("n", "<leader>n", ":noh<CR>", { silent = true })
vim.keymap.set("t", "<C-j><C-k>", "<C-\\><C-n><C-w>h", { silent = true })

-- navigation
vim.keymap.set("n", "<C-h>", ":tabprev<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":tabnext<CR>", { silent = true })

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/Mofiqul/vscode.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/coder/claudecode.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/f-person/git-blame.nvim" },
	{ src = "https://github.com/github/copilot.vim" },
	{ src = "https://github.com/pwntester/octo.nvim" }
})
require("mini.icons").setup()
require("mini.completion").setup()
require("mini.comment").setup {
	mappings = {
		comment_visual = "<leader><leader>"
	}
}
require("mini.starter").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup {
	mappings = {
		toggle = "<leader>ss"
	}
}

require("octo").setup {
	picker = "fzf-lua",
	enable_builtin = true,
}
vim.keymap.set("n", "<leader>o", "<cmd>Octo<CR>", { silent = true })


require("nvim-tree").setup {
	view = {
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				width = 100,
				height = 40,
				col = math.floor((vim.o.columns - 100) / 2),
				row = math.floor((vim.o.lines - 40) / 2),
				style = "minimal",
				border = "rounded"
			},
		},
		width = 100,
	},
}
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", { silent = true })

require("gitblame").setup {
	date_format = "%Y-%m-%d",
	highlight_group = "LspInlayHint"
}

require("snacks").setup {
	indent = { enabled = true },
	explorer = { enabled = false },
	picker = { enabled = false },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	terminal = { enabled = true },
	zen = { enabled = true },
}
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { silent = true })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { silent = true })
vim.keymap.set("n", "<leader>ft", "<cmd>FzfLua tabs<cr>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>fl", "<cmd>FzfLua live_grep<cr>", { silent = true })
vim.keymap.set("n", "<leader>fgv", "<cmd>FzfLua git_blame<cr>", { silent = true })
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<cr>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", { silent = true })
vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<cr>", { silent = true })
vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", { silent = true })
vim.keymap.set("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", { silent = true })
vim.keymap.set("n", "<leader>df", "<cmd>FzfLua diagnostics_workspace<cr>", { silent = true })
vim.keymap.set("n", "<leader>lf", "<cmd>FzfLua lsp_finder<cr>", { silent = true })
vim.keymap.set("n", "<leader>kf", "<cmd>FzfLua keymaps<cr>", { silent = true })

vim.keymap.set("n", "<leader>z", ":lua Snacks.zen()<CR>", { silent = true })
vim.keymap.set("n", "<leader>of", function() Snacks.gitbrowse({ branch = "master" }) end, { silent = true })
vim.keymap.set("v", "<leader>of", function() Snacks.gitbrowse({ branch = "master" }) end, { silent = true })
vim.keymap.set("n", "<leader>t", function() Snacks.terminal.toggle('zsh', {}) end, { silent = true })

require("claudecode").setup {
	terminal_cmd = "~/.claude/local/claude"
}
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>")
vim.keymap.set("v", "<leader>s", "<cmd>ClaudeCodeSend<CR>")

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"terraformls",
	"ts_ls"
})
vim.lsp.inlay_hint.enable(true, { 0 })

vim.keymap.set("n", "<Space>f", vim.lsp.buf.format)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename)

vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)

vim.cmd("colorscheme vscode")
vim.cmd(":hi statusline guibg=NONE")

-- Bufferを開いた時にtreesitterが効かないのでTSEnableをする
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		vim.cmd("TSEnable highlight")
	end,
})
-- RootディレクトリをPWDにする
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local handle = io.popen(
			'git rev-parse --show-superproject-working-tree --show-toplevel 2>/dev/null | head -1')
		if handle then
			local root = handle:read("*a"):gsub("\n", "")
			handle:close()
			if root ~= "" and vim.fn.getcwd() ~= root then
				vim.cmd("cd " .. root)
			end
		end
	end
})
