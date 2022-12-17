-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

vim.cmd [[highlight IndentBlanklineContextStart guisp=Pink gui=underline]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=Pink gui=nocombine]]

local indent_blankline = require("indent_blankline")

indent_blankline.setup {
    char = "▏",
    -- show_end_of_line = true,
    show_trailing_blankline_indent = false,
    -- show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,

    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
    },
}

