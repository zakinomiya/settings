require "nvchad.options"

vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/snippets"

-- add yours here!
vim.cmd [[
  autocmd BufRead * Copilot enable
]]

local dap, dapui = require "dap", require "dapui"
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
