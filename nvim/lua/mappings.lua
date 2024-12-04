require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<leader>qa", ":qa<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>v", "")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>n", ":noh<CR>")
map("n", "<leader>dw", ":Telescope diagnostics<CR>")
map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)
map("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end)
map("n", "<C-k>", "vim.diagnostic.get_prev()")
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })

map("n", "<leader>tn", ":TestNearest<CR>", { desc = "test the nearest test" })

map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "toggle breakpoint" })
map("n", "<leader>dba", ":lua require'dap'.clear_breakpoints()<CR>", { desc = "clear all breakpoints" })
map(
  "n",
  "<leader>v",
  ":lua require'dapui'.float_element('scopes', {width=500})<CR>:lua require'dapui'.float_element('scopes', {width=500})<CR>",
  { desc = "show variables" }
)

-- map("n", "<CR>", ":@a<CR>", { desc = "repeat the last debug command" })
map("n", "<leader>dd", ':lua require"dap".continue()<CR>', { desc = "show variables" })
map("n", "<leader>dn", ':lua require"dap".run_last()<CR>', { desc = "new debugging session" })
map("n", "<leader>d", ":let @a='lua require\"dap\".run_to_cursor()'<CR>:@a<CR>", { desc = "run to cursor" })

map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", " f", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

map("n", "<leader>wk", "")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
