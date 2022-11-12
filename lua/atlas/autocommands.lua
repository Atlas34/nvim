-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup plug_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PlugInstall
  augroup end
]]

-- enable spelling check on markdown
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.cmd([[:setlocal wrap]])
    vim.cmd([[:setlocal spell]])
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})
--
