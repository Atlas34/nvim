M = {}

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lsp plugins not found!")
  return
end

M.server_capabilities = function()
  local active_clients = vim.lsp.get_active_clients()
  local active_client_map = {}

  for index, value in ipairs(active_clients) do
    active_client_map[value.name] = index
  end

  vim.ui.select(vim.tbl_keys(active_client_map), {
    prompt = "Select client:",
    format_item = function(item)
      return "capabilites for: " .. item
    end,
  }, function(choice)
    -- print(active_client_map[choice])
    print(vim.inspect(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities.executeCommandProvider))
    vim.pretty_print(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities)
  end)
end

require "atlas.lsp.lsp-signature"
require "atlas.lsp.mason"
require("atlas.lsp.handlers").setup()
require "atlas.lsp.null-ls"
require "atlas.lsp.lsp_lines"
