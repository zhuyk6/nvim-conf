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
local postfix = require("luasnip.extras.postfix").postfix

return {
    s({
        trig = "mk",
        name = "Inline Math",
        dscr = "Inline Math Environment",
    },
        fmt("${}$", {i(1)})
    ),

    s({
        trig = "mkk",
        name = "Block Math",
    },
        fmt([[
        $$
        {}
        $$
        ]], {i(1, "equation")})
    ),

    s({
        trig = "fr",
        name = "Fractional",
        dscr = "Fractional",
    },
        fmt("\\frac{{ {} }}{{ {} }}", {i(1), i(2)})
    ),

    s({
        trig = "br",
        name = "Parentheses",
        dscr = "Large Parentheses",
    },
        fmt("\\left( {} \\right)", {i(1)})
    ),

    s({
        trig = "sum",
        name = "Sum",
    },
        fmt("\\sum_{{ {} }}^{{ {} }}", {
            i(1, "i=0"),
            i(2, "n")
        })
    ),

    -- Braket : Dirac notation for quantum states
    s({
        trig = "ket",
        name = "Ket",
        dscr = "Column vector",
    },
        fmt("\\left| {} \\right\\rangle", {
            i(1, "\\psi")
        })
    ),
    s({
        trig = "bra",
        name = "Bra",
        dscr = "Row vector",
    },
        fmt("\\left\\langle {} \\right|", {
            i(1, "\\psi")
        })
    ),

    -- Subscript and superscript 
    postfix({
        trig = ".sb",
        name = "Subscript",
    }, {
        l(l.POSTFIX_MATCH .. "_{"),
        i(1),
        t("}")
    }),
    postfix({
        trig = ".sp",
        name = "superscript",
    }, {
        l(l.POSTFIX_MATCH .. "^{"),
        i(1),
        t("}"),
    }),

    -- Some symbol
    s("inf", {t("\\infty")}),
}, {

}
