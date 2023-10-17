local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
  vim.notify("schemastore plugins not found!")
  return nil
end

return {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
    },
  },
  setup = {
    commands = {
      format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

