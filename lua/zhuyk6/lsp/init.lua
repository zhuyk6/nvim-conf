local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- Manual setup
-- require("zhuyk6.lsp.mason")
-- require("zhuyk6.lsp.handlers").setup()

-- lsp-setup.nvim
require("neodev").setup({})

require('lsp-setup').setup({
    -- Default mappings
    -- gD = 'lua vim.lsp.buf.declaration()',
    -- gd = 'lua vim.lsp.buf.definition()',
    -- gt = 'lua vim.lsp.buf.type_definition()',
    -- gi = 'lua vim.lsp.buf.implementation()',
    -- gr = 'lua vim.lsp.buf.references()',
    -- K = 'lua vim.lsp.buf.hover()',
    -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
    -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
    -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
    -- ['<space>e'] = 'lua vim.diagnostic.open_float()',
    -- ['[d'] = 'lua vim.diagnostic.goto_prev()',
    -- [']d'] = 'lua vim.diagnostic.goto_next()',
    default_mappings = false,
    -- Custom mappings, will overwrite the default mappings for the same key
    -- Example mappings for telescope pickers:
    -- gd = 'lua require"telescope.builtin".lsp_definitions()',
    -- gi = 'lua require"telescope.builtin".lsp_implementations()',
    -- gr = 'lua require"telescope.builtin".lsp_references()',
    mappings = {
        gd             = "lua vim.lsp.buf.definition()",
        gD             = "lua vim.lsp.buf.declaration()",
        gi             = "lua vim.lsp.buf.implementation()",
        gt             = "lua vim.lsp.buf.type_definition()",
        gr             = "lua vim.lsp.buf.references()",
        K              = "lua vim.lsp.buf.hover()",
        ['<C-k>']      = "lua vim.lsp.buf.signature_help()",
        go             = "lua vim.diagnostic.open_float()",
        gj             = "lua vim.diagnostic.goto_next()",
        gk             = "lua vim.diagnostic.goto_prev()",
        ['<leader>rn'] = "lua vim.lsp.buf.rename()",
        ['<leader>ca'] = "lua vim.lsp.buf.code_action()",
        -- ['<leader>f']  = "lua vim.lsp.buf.format({async = true})",
    },
    -- Global on_attach
    on_attach = function(client, bufnr)
        -- Support custom the on_attach function for global
        -- Formatting on save as default
        require('lsp-setup.utils').format_on_save(client)
    end,
    -- Global capabilities
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    -- Configuration of LSP servers
    servers = {
        -- Install LSP servers automatically
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        pyright = {},
        sumneko_lua = {
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        },
        clangd = require("lsp-setup.clangd_extensions").setup({}),

        -- rust_analyzer = {
        --     settings = {
        --         ['rust-analyzer'] = {
        --             cargo = {
        --                 loadOutDirsFromCheck = true,
        --             },
        --             procMacro = {
        --                 enable = true,
        --             },
        --         },
        --     },
        -- },
    },
})
