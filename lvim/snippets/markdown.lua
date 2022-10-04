local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node
-- local c = ls.choice_node
-- local fmt = require("luasnip.extras.fmt").fmt

local datefmt = '%Y-%m-%d'
local function datestr(format, time)
  return time and os.date(format, time) or os.date(format)
end


ls.add_snippets("markdown", {
  s("today", {t(datestr(datefmt, os.time()))}),
}, {
  key = "today",
})
