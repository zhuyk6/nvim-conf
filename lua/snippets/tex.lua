local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

return {
    s({
        trig = "mk",
        name = "Inline Math",
        dscr = "Inline Math Environment",
    }, {
        t("$ "),
        i(1),
        t(" $"),
        i(0),
    }
    ),

    s({
        trig = "fr",
        name = "Fractional",
        dscr = "Fractional",
    },{
        t("\\frac{"),
        i(1),
        t("}{"),
        i(2),
        t("}"),
        i(0),
    }
    ),
    
    s({
        trig = "br",
        name = "Parentheses",
        dscr = "Large Parentheses",
    }, {
        t("\\left( "),
        i(1),
        t(" \\right)"),
    }),
}, {
        
}
