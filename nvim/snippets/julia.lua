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
    { trig = ";jld", dscr = "jldoctest block", snippetType = "autosnippet" },
    fmt(
      [[
     ```jldoctest
     {}
     ```
    ]],
      { i(1) }
    )
  ),

  s(
    { trig = ";math", dscr = "math block", snippetType = "autosnippet" },
    fmt(
      [[
     ```math
     {}
     ```
    ]],
      { i(1) }
    )
  ),

  s({ trig = ";ref", dscr = "Documentation reference", snippetType = "autosnippet" }, fmt("[`{}`](@ref)", { i(1) })),
}
