local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("zhuyk6.lsp.mason")
require("zhuyk6.lsp.handlers").setup()
