local M = {
  "SmiteshP/nvim-navic",
  lazy = true,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', event = "VeryLazy" },
    { 'neovim/nvim-lspconfig', event = "VeryLazy" },
  }
}

function M.config()
  local icons = require 'atlas.icons'
  local MyConfig = {
    options = {
      icons = {
        File = icons.documents.File .. ' ',
        Module = icons.kind.Module .. ' ',
        Namespace = icons.ui.Project .. ' ',
        Package = icons.ui.Package .. ' ',
        Class = icons.kind.Class .. ' ',
        Method = icons.kind.Method .. ' ',
        Property = icons.kind.Property .. ' ',
        Field = icons.kind.Field .. ' ',
        Constructor = icons.kind.Constructor .. ' ',
        Enum = icons.kind.Enum .. ' ',
        Interface = icons.kind.Interface .. ' ',
        Function = icons.kind.Function .. ' ',
        Variable = icons.kind.Variable .. ' ',
        Constant = icons.kind.Constant .. ' ',
        String = icons.type.String .. ' ',
        Number = icons.type.Number .. ' ',
        Boolean = icons.type.Boolean .. ' ',
        Array = icons.type.Array .. ' ',
        Object = icons.type.Object .. ' ',
        Key = icons.type.Key .. ' ',
        Null = icons.type.Null .. ' ',
        EnumMember = icons.kind.EnumMember .. ' ',
        Struct = icons.kind.Struct .. ' ',
        Event = icons.kind.Event .. ' ',
        Operator = icons.kind.Operator .. ' ',
        TypeParameter = icons.kind.TypeParameter .. ' '
      },
      highlight = true,
      lsp = {
        auto_attach = true,
      },
      separator = " " .. icons.ui.ChevronRight .. " ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true,
      lazy_update_context = false,
      click = false
    }
  }

  local winbar_status_ok, winbar = pcall(require, "atlas.winbar")
  if not winbar_status_ok then
    vim.notify("atlas.winbar not found!")
    return
  end

  winbar.create_winbar()

  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    vim.notify("nvim-navic plugins not found!")
    return
  end

  navic.setup(MyConfig.options)
end

return M
