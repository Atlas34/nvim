local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify("Comment.nvim Plugins not found!")
  return
end

comment.setup {
  ---LHS of toggle mappings in NORMAL + VISUAL mode
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>cc',
    ---Block-comment toggle keymap
    block = '<leader>bc',
  },
  ---LHS of operator-pending mappings in NORMAL + VISUAL mode
  ---@type table
  opleader = {
    ---Line-comment keymap
    line = '<leader>c',
    ---Block-comment keymap
    block = '<leader>b',
  },
}
