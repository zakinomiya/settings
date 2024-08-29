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

ls.add_snippets("zig", {
  s("deb", { t("std.debug.print(\""), i(1, "text"), t("\\n\", .{});") }),
  s("ist", { t("const std = @import(\"std\");") }),
  s("aare", { t("var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);") })
}, {
  key = "zig",
})
