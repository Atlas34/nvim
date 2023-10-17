local M = {
  'jinh0/eyeliner.nvim',
  keys = {
    {"f", "f" },
    {"F", "F" },
    {"t", "t" },
    {"T", "T" },
  },
}

function M.config()
  local status_ok, eyeliner = pcall(require, "eyeliner")
  if not status_ok then
    vim.notify("eyeliner.nvim Plugins not found!")
    return nil
  end
  eyeliner.setup {
    highlight_on_key = true, -- show highlights only after keypress
    dim = true              -- dim all other characters if set to true (recommended!)
  }

  vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#BB77FF', bold = true, underline = true })
  vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#7EFF7E', underline = true })
end

return M
