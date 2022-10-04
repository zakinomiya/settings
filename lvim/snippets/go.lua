local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node


ls.add_snippets("go", {
  s("ife", {t({"if err != nil {", "  return err", "}"})})
}, {
  key = "go",
})
