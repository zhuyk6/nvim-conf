-- set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Window navigation
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Left>", "vertical resize -2<CR>", opt)
map("n", "<C-Right>", "vertical resize +2<CR>", opt)

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opt)
map("n", "<S-h>", ":bprevious<CR>", opt)
map("n", "<S-q>", "<cmd>Bdelete!<CR>", opt)

-- Insert --
-- Press jk fast to enter normal mode 
map("i", "jk", "<ESC>", opt)

-- Visual
-- Stay in indent mode 
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)


-- Plugins --
-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

-- illuminate
map('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
map('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})

-- Git
-- map("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opt)
map("n", "<leader>g", "<cmd>lua _GITUI_TOGGLE()<CR>", opt)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
map("n", "<leader>fp", ":Telescope projects<CR>", opt)

local pluginKeys = {}

-- lsp 
pluginKeys.lsp_keymaps = function(bufnr)
    local mapbuf = function(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)

    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)

    -- go to
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)

    -- diagnostic
    mapbuf("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

    -- format
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true })
end

return pluginKeys
