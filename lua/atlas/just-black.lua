local M = {
  'Atlas34/just-black.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}


function M.config()
  local status_ok, _ = pcall(require, "just-black")
  if not status_ok then
    vim.notify("Just-Black Plugins not found!")
    return nil
  end

  vim.cmd('colorscheme just-black')
end

return M
