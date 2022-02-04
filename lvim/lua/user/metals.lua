local M = {}

M.config = function()
  local metals = require("metals")
  local metals_config = metals.bare_config()
  metals_config.on_attach = require("lvim.lsp").common_on_attach
  metals_config.settings = {
    showImplicitArguments = false,
    showInferredType = true,
    excludedPackages = {},
  }
  metals_config.init_options.statusBarProvider = false
  metals.initialize_or_attach { metals_config }
end

return M
