local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

local datefmt = '%Y-%m-%d'
local function plus_days_sec(n) return n * 24 * 60 * 60 end
local function datestr(format, time)
  return time and os.date(format, time) or os.date(format)
end


ls.add_snippets("todo", {
  s("pr", {t("+"), i(1, "name")}),
  s("ctx", {t("@"), i(1, "name")}),
  s("due", {t("due:" .. datestr(datefmt, os.time() + plus_days_sec(7))) }),
  s(
    "nt",
    fmt("({priority}) " ..  datestr(datefmt) .. " {desc}",
    {
      priority = c(1, {t("A"), t("B"), t("C"), t("")}),
      desc = i(2, "Description"),
    })
  )
}, {
  key = "todo",
})
