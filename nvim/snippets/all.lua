local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {

  s(
    { trig = ";bl", dscr = "Code block", snippetType = "autosnippet" },
    fmt(
      [[
     ```
     {}
     ```
    ]],
      { i(1) }
    )
  ),

  s(
    { trig = ";julia", dscr = "Julia code block", snippetType = "autosnippet" },
    fmt(
      [[
     ```julia
     {}
     ```
    ]],
      { i(1) }
    )
  ),

  ls.s({ trig = "foo" }, { t("Another snippet.") }),

  s({ trig = ";a", snippetType = "autosnippet" }, {
    t("\\alpha"),
  }),
}
