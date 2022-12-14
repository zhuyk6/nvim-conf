-- show line number
vim.o.number = true
-- vim.o.relativenumber = true

-- allows neovim to access the system clipboard
vim.o.clipboard = "unnamedplus"

-- set tab 
vim.o.tabstop = 4       -- tab length
vim.o.shiftwidth = 4
vim.o.expandtab = true  -- tab to space

-- use mouse
vim.o.mouse = 'a'

-- set cursor line highlight
vim.o.cursorline = true

-- set search result highlight
vim.o.hlsearch = true

-- set smart indent
vim.o.smartindent = true

-- theme
vim.o.background = "dark"
vim.cmd[[colorscheme tokyonight]]

-- -- use vscode theme
-- vim.o.background = 'dark'
--
-- local c = require('vscode.colors')
-- require('vscode').setup({
--     -- Enable transparent background
--     transparent = true,
--
--     -- Enable italic comment
--     italic_comments = true,
--
--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,
--
--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         vscLineNumber = '#FFFFFF',
--     },
--
--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--     }
-- })
