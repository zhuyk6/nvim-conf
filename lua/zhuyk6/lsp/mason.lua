local servers = require("zhuyk6.lsp.servers")

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("zhuyk6.lsp.handlers").on_attach,
		capabilities = require("zhuyk6.lsp.handlers").capabilities,
	}
    if server == "clangd" then
        opts.capabilities.offsetEncoding = "utf-8"
    else
        opts.capabilities.offsetEncoding = {"utf-8"}
    end

	server = vim.split(server, "@")[1]
	local require_ok, conf_opts = pcall(require, "zhuyk6.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
		-- require("notify")(server .. " configuration loaded!", vim.log.levels.INFO)
	end

	lspconfig[server].setup(opts)
end
