local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    },
}

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'  -- Speed up loading Lua modules in Neovim to improve startup time.
    use "nvim-lua/plenary.nvim"     -- Used by many lua plugins

    -- Coding
    use "max397574/better-escape.nvim"
    use {
        "windwp/nvim-autopairs",
        config = function ()
            require("zhuyk6.conf.autopairs")
        end,
    }
    use {
        'numToStr/Comment.nvim',                        -- Comment plugin
        config = function()
            require('zhuyk6.conf.Comment')
        end
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'   -- for tsx/jsx comment
    use {
        "lukas-reineke/indent-blankline.nvim",          -- indentation guides
        config = function()
            require("zhuyk6.conf.indentline")
        end
    }
    use {
        "norcalli/nvim-colorizer.lua",                      -- colorizer
        config = function()
            require("colorizer").setup()
        end
    }
    use {
        "rlue/vim-barbaric",    -- switch to English input method when goto Normal mode
        config = function()
            vim.g.barbaric_ime = "fcitx"
            vim.g.barbaric_fcitx_cmd = "fcitx5-remote"
        end
    }
    use {
        "ggandor/leap.nvim",    -- motion
        config = function()
            require('leap').add_default_mappings()
        end
    }
    use {
        "kylechui/nvim-surround",   -- surround
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
    use {
        "RRethy/vim-illuminate",    -- Highlight the word under cursor
        config = function()
            require("zhuyk6.conf.illuminate")
        end
    }
    use 'mrjones2014/legendary.nvim'    -- keybindings

    -- LSP completion
    use "hrsh7th/nvim-cmp"          -- The completion plugin
    use "hrsh7th/cmp-buffer"        -- buffer completions
    use "hrsh7th/cmp-path"          -- path completions
    use "saadparwaiz1/cmp_luasnip"  -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "onsails/lspkind.nvim"      -- adds vscode-like pictograms to neovim built-in lsp

    -- snippets
    use "L3MON4D3/LuaSnip"              --snippet engine
    use "rafamadriz/friendly-snippets"  -- a bunch of snippets to use

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",  -- Easily install and manage LSP servers, DAP servers, linters, and formatters
        "williamboman/mason-lspconfig.nvim",
        'junnplus/lsp-setup.nvim',  -- Wrapper for nvim-lspconfig and mason-lspconfig
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",      -- Linter and formatter
        config = function()
            require("zhuyk6.conf.null-ls-conf")
        end,
    }
    use "folke/neodev.nvim"             -- Lua
    use "p00f/clangd_extensions.nvim"   -- Cpp

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("zhuyk6.conf.treesitter-conf")
        end
    }
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require("zhuyk6.conf.telescope")
        end
    }

--    -- LSP saga 
--    use {
--        "glepnir/lspsaga.nvim",
--        branch = "main",
--        config = function()
--            local saga = require("lspsaga")
--            saga.init_lsp_saga({
--                -- your configuration
--            })
--        end,
--    }

    -- UI 
    use 'kyazdani42/nvim-web-devicons'          -- icons and colors
    use {
        'nvim-tree/nvim-tree.lua',              -- File explorer
        config = function()
            require("zhuyk6.conf.nvim-tree")
        end
    }
    use {
        "akinsho/toggleterm.nvim", tag = '*',   -- terminal
        config = function()
            require("zhuyk6.conf.toggleterm")
        end
    }
    use {
        'akinsho/bufferline.nvim', tag = "v3.*",-- bufferline
        config = function()
            require("zhuyk6.conf.bufferline")
        end
    }
    use "moll/vim-bbye"                         -- Close buffer 
    use {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end
    }
    use {
        'stevearc/dressing.nvim',               -- Improve the default vim.ui interfaces 
        config = function()
            require("zhuyk6.conf.dressing")
        end
    }

    -- vscode theme
    use 'Mofiqul/vscode.nvim'
    -- tokyonight theme
    use 'folke/tokyonight.nvim'

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('zhuyk6.conf.lualine-conf')
        end
    }

    -- greeter for nvim
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }

    -- Markdown preview
     use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
end)
