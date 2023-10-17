local M = {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    { "williamboman/mason.nvim", lazy = false },
    { "nvim-lua/plenary.nvim", lazy = false },
    { 'tamago324/nlsp-settings.nvim', lazy = false },
  }
}

M.servers = {
  "lua_ls",
  "pyright",
  "clangd",
  "bashls",
  "jsonls",
  "yamlls",
}

function M.config()
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

  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    vim.notify("mason Plugins not found!")
    return
  end

  mason.setup(settings)

  local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not status_ok_mason_lspconfig then
    vim.notify("mason_lspconfig Plugins not found!")
    return
  end

  mason_lspconfig.setup {
    ensure_installed = M.servers,
    automatic_installation = true,
  }
end

return M
