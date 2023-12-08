
local M = {
  'echasnovski/mini.indentscope',
  event = 'VeryLazy',
  version = false
}

function M.config()
  local status_ok, mini_identscope = pcall(require, 'mini.indentscope')

  if not status_ok then
    vim.notify("mini.indentscope Plugins not found!")
    return nil
  end

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "help",
      "neo-tree",
      'NvimTree',
      "lazy",
      "mason",
      "notify",
      "toggleterm",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })

  mini_identscope.setup(
    {
      symbol = "│",
      options = { try_as_border = true },
    }
  )
end

return M
