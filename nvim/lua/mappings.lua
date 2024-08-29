require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
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
