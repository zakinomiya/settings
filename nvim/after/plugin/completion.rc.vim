set completeopt=menu,menuone,noselect

lua <<EOF
local cmp = require('cmp')
local types = require("cmp.types")
local str = require("cmp.utils.str")
local lspkind = require('lspkind')

cmp.setup({
	completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		scrollbar = "║",
	},
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  formatting = {
     format = function(entry, vim_item)
         -- fancy icons and a name of kind
         vim_item.kind = require("lspkind").presets.default[vim_item.kind] ..
                             " " .. vim_item.kind
         -- set a name for each source
         vim_item.menu = ({
             buffer = "[Buffer]",
             nvim_lsp = "[LSP]",
             ultisnips = "[UltiSnips]",
             nvim_lua = "[Lua]",
             cmp_tabnine = "[TabNine]",
             look = "[Look]",
             path = "[Path]",
             spell = "[Spell]",
             calc = "[Calc]",
             emoji = "[Emoji]"
         })[entry.source.name]
         return vim_item
     end
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'ultisnips' },
    { name = 'cmp_tabnine' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'vim-dadbod-completion' },
  },
  experimental = {
    ghost_text = true
  },
})

-- TabNine
local tabnine = require('cmp_tabnine.config')
tabnine:setup({max_lines = 1000, max_num_results = 20, sort = true})

-- Database completion
vim.api.nvim_exec([[
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]], false)
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

