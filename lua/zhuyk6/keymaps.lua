-- set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local wk = require("which-key")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Insert --
-- Press jk fast to enter normal mode 
-- map("i", "jk", "<ESC>", opt)
require("better_escape").setup {
    mapping = {"jk"}, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
    -- example(recommended)
    -- keys = function()
    --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
    -- end,
}

-- Visual
-- Stay in indent mode 
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)


-- Plugins --
-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- illuminate
map('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
map('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})

-- wk.register({
--     ["<a-n>"] = {
--         "<cmd>lua require('illuminate').next_reference{wrap=true}<CR>",
--         "Illuminate Next Reference",
--     },
--     ["<a-p>"] = {
--         "<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<CR>",
--         "Illuminate Last Reference",
--     }
-- })


-- Telescope
-- map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
-- map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
-- map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
-- map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
-- map("n", "<leader>fp", ":Telescope projects<CR>", opt)
wk.register({
    ["<leader>f"] = {
        name = "+file",
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        g = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        n = {"<cmd>enew<cr>", "New File"},
    },
    -- Git
    ["<leader>g"] = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit"},
})

local pluginKeys = {}

-- lsp 
pluginKeys.lsp_keymaps = function(bufnr)
    local mapbuf = function(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

    -- go to
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    -- diagnostic
    mapbuf("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

    -- format
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", {noremap = true})
end

return pluginKeys
