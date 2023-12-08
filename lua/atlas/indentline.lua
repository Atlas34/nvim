local M = {
  'lukas-reineke/indent-blankline.nvim',
  event = { "BufReadPre", "BufNewFile" },
  main = 'ibl'
}

function M.config()
  local status_ok, ibl = pcall(require, 'ibl')

  if not status_ok then
    vim.notify("indent-blankline Plugins not found!")
    return nil
  end

  ibl.setup {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "neo-tree",
        'NvimTree',
        "lazy",
        "mason",
        "notify",
        "toggleterm",
      },
    },
  }
end

return M

