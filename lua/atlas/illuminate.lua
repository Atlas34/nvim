local M = {
  'RRethy/vim-illuminate',
  event = 'VeryLazy'
}

function M.config()
  local status_ok, illuminate = pcall(require, 'illuminate')

  if not status_ok then
    vim.notify("illuminate Plugins not found!")
    return nil
  end

  illuminate.configure {
    filetypes_denylist = {
      'mason',
      'qf',
      'NvimTree',
      'lazy',
      'netrw',
      'DiffviewFiles',
      'Outline',
      'toggleterm',
      'DressingSelect',
      'TelescopePrompt',
    },
  }

  vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
  vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
end

return M
