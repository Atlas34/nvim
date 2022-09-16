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
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Disable winbar on certain filetype
vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
  callback = function()
    local winbar_filetype_exclude = {
      "help",
      "plug",
      "NvimTree",
      "Trouble",
      "toggleterm",
    }

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt_local.winbar = nil
      return
    end

    local value = require("atlas.winbar").gps()

    if value == nil then
      value = require("atlas.winbar").filename()
    end

    vim.opt_local.winbar = value
  end,
})


