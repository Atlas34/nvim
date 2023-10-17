local M = {
  'Maan2003/lsp_lines.nvim',
  event = "LspAttach",
}

function M.config()
  local lsp_lines_status_ok, lsp_lines = pcall(require, "lsp_lines")
  if not lsp_lines_status_ok then
    vim.notify("lsp_lines Plugins not found!")
    return nil
  end

  lsp_lines.setup({})

  vim.keymap.set(
  "",
  "<Leader>ll",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
  )
end

return M
