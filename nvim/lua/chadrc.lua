-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "vscode_dark",
  changed_themes = {
    vscode_dark = {
      base_30 = {
        green2 = "#71C6B1",
      },
    },
  },

  hl_override = {
    ["@property"] = { fg = "cyan" },
    ["@variable.parameter"] = { fg = "cyan" },
    ["@keyword.function"] = { fg = "blue" },
    ["Type"] = { fg = "green2" },
    ["@type.builtin"] = { fg = "green2" },
    ["@constant"] = { fg = "cyan" },
    ["Include"] = { fg = "blue" },
    ["@module"] = { fg = "green2" },
    ["@variable.member"] = { fg = "cyan" },
    ["@keyword.repeat"] = { fg = "#C586C0" },
    ["@constant.builtin"] = { fg = "blue" },
    ["@comment"] = { fg = "light_grey" },
  },
}

return M
