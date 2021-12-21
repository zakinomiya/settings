lua << EOF
local nvim_lsp = require('lspconfig')
local handlers = vim.lsp.handlers

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, pop_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gk', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts) buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

end

local lspdir = os.getenv("HOME") .. "/.config/lsp"
local function lsp(name, filetypes, cmd, settings)
  return {
    name = name,
    filetypes = filetypes,
    cmd = cmd,
    settings = settings
  }
end

local lsps = {
  lsp("metals", {"scala"})
  , lsp("tsserver", {"typescript", "typescriptreact", "typescript.tsx" })
  , lsp("rls", {"rust"})
  , lsp("gopls", {"go"}, nil, { gopls = { usePlaceholders = true}})
  , lsp("julials", {"julia"})
  , lsp("pyright", {"python"})
  , lsp("zeta_note", {"markdown"}, { lspdir .. "/markdown/zeta-note-macos" })
  , lsp("sumneko_lua", {"lua"}, {lspdir .. "/lua-language-server/bin/macOS/lua-language-server", lspdir .. "/lua-language-server/bin/macOS/main.lua"})
}

-- enable nvim-comp 
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, l in ipairs(lsps) do
  nvim_lsp[l["name"]].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = l["filetypes"],
    flags = {
      debounce_text_changes = 150,
    },
    cmd = l["cmd"],
    settings = l["settings"],
  }
end
EOF

au filetype python nnoremap <space>f <cmd>call Autopep8()<CR>

" autopep8
function! Autopep8() range
  execute  "0,$!" 'autopep8' . ' -'
endfunction

