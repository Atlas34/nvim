local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason Plugins not found!")
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  vim.notify("mason_lspconfig Plugins not found!")
  return
end

local servers = {
  "sumneko_lua",
  "pyright",
  "clangd",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)

mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("lspconfig Plugins not found!")
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("atlas.lsp.handlers").on_attach,
    capabilities = require("atlas.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@", {})[1]

  if server == "jsonls" then
    local jsonls_opts = require "atlas.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "sumneko_lua" then
    local sumneko_opts = require "atlas.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)

    local neodev_status_ok, neo_dev = pcall(require, "neodev")
    if not neodev_status_ok then
      vim.notify("neodev Plugins not found!")
      return
    end
    local neodev_opts = require "atlas.lsp.settings.neodev"
    neo_dev.setup(neodev_opts)

    lspconfig.sumneko_lua.setup(opts)
    goto continue
  end

  if server == "pyright" then
    local pyright_opts = require "atlas.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "solc" then
    local solc_opts = require "atlas.lsp.settings.solc"
    opts = vim.tbl_deep_extend("force", solc_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require "atlas.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end
