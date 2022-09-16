local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lsp plugins not found!")
  return
end

require "atlas.lsp.lsp-signature"
require "atlas.lsp.lsp-installer"
require("atlas.lsp.handlers").setup()
require "atlas.lsp.null-ls"
