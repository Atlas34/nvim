local M = {
  'j-hui/fidget.nvim',
  tag = "legacy",
  event = "LspAttach",
}

function M.config()
  local status_ok, fidget = pcall(require, "fidget")
  if not status_ok then
    vim.notify("fidget.nvim plugins not found!")
    return nil
  end

  fidget.setup({})
end

return M
