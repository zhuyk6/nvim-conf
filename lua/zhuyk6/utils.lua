-- reload nvim configuration
function _G.reload_nvim_conf()
    for name,_ in pairs(package.loaded) do
        if name:match('^zhuyk6') then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("ReloadConfig", "lua reload_nvim_conf()", {})
