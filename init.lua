-- Speed up loading Lua modules in Neovim to improve startup time.
require("impatient").enable_profile()

require("localconf")

require("keymaps")

require("plugins")

require("cmp-conf")

require("lsp")

