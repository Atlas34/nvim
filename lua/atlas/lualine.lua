local M = {
  'nvim-lualine/lualine.nvim',
  lazy = false
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    vim.notify("lualine Plugins not found!")
    return
  end

  local theme_colors = {
    black        = '#202020',
    neon         = '#DFFF00',
    white        = '#FFFFFF',
    green        = '#00D700',
    purple       = '#5F005F',
    blue         = '#00DFFF',
    darkblue     = '#00005F',
    navyblue     = '#000080',
    brightgreen  = '#9CFFD3',
    gray         = '#444444',
    darkgray     = '#3c3836',
    lightgray    = '#504945',
    inactivegray = '#7c6f64',
    orange       = '#FFAF00',
    red          = '#5F0000',
    brightorange = '#C08A20',
    brightred    = '#AF0000',
    cyan         = '#00DFFF',
  }

  local custom_powerline_dark = {
    normal = {
      a = { bg = theme_colors.neon, fg = theme_colors.black, gui = 'bold' },
      b = { bg = theme_colors.gray, fg = theme_colors.white },
      c = { bg = theme_colors.black, fg = theme_colors.brightgreen },
    },
    insert = {
      a = { bg = theme_colors.blue, fg = theme_colors.darkblue, gui = 'bold' },
      b = { bg = theme_colors.navyblue, fg = theme_colors.white },
      c = { bg = theme_colors.black, fg = theme_colors.blue },
    },
    visual = {
      a = { bg = theme_colors.orange, fg = theme_colors.black, gui = 'bold' },
      b = { bg = theme_colors.darkgray, fg = theme_colors.white },
      c = { bg = theme_colors.black, fg = theme_colors.orange },
    },
    replace = {
      a = { bg = theme_colors.brightred, fg = theme_colors.white, gui = 'bold' },
      b = { bg = theme_colors.cyan, fg = theme_colors.darkblue },
      c = { bg = theme_colors.black, fg = theme_colors.brightred },
    },
    command = {
      a = { bg = theme_colors.green, fg = theme_colors.black, gui = 'bold' },
      b = { bg = theme_colors.darkgray, fg = theme_colors.white },
      c = { bg = theme_colors.black, fg = theme_colors.brightgreen },
    },
    inactive = {
      a = { bg = theme_colors.darkgray, fg = theme_colors.gray, gui = 'bold' },
      b = { bg = theme_colors.darkgray, fg = theme_colors.gray },
      c = { bg = theme_colors.darkgray, fg = theme_colors.gray },
    },
  }

  local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#08d40f',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
  }

  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  local icons = require "atlas.icons"

  local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn", "info" },
    symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " ", info = icons.diagnostics.Information .. " " },
    colored = true,
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.blue },
    },
    update_in_insert = false,
    always_visible = true,
  }


  local list_registered_formatter = function(filetype)
    local s = require "null-ls.sources"
    local available_sources = s.get_available(filetype)
    local registered = {}
    for _, source in ipairs(available_sources) do
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end
    return registered or {}
  end

  local list_registered_linter = function(filetype)
    local null_ls = require "null-ls"
    local alternative_methods = {
      null_ls.methods.DIAGNOSTICS,
      null_ls.methods.DIAGNOSTICS_ON_OPEN,
      null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }
    local registered_providers = list_registered_formatter(filetype)
    local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
      return registered_providers[m] or {}
    end, alternative_methods))

    return providers_for_methods
  end

  local lsp = {
    function(msg)
      msg = msg or "No LSP"

      local buf_clients = vim.lsp.buf_get_clients()

      if next(buf_clients) == nil then
        -- TODO: clean up this if statement
        if type(msg) == "boolean" or #msg == 0 then
          return "No LSP"
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      -- add formatter
      local supported_formatters = list_registered_formatter(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local supported_linters = list_registered_linter(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      local unique_client_names = vim.fn.uniq(buf_client_names)
      local language_servers = table.concat(unique_client_names, ", ")

      return language_servers
    end,
    icon = icons.misc.lsp .. ":",
    color = { gui = "bold" },
    cond = hide_in_width,
  }

  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
    diff_color = { added = { fg = colors.green }, modified = { fg = colors.orange }, removed = { fg = colors.red } }, -- changes diff colors
    cond = hide_in_width,
  }

  local mode = {
    "mode",
    fmt = function(str)
      return " " .. str .. " "
    end,
  }

  local filetype = {
    "filetype",
    icons_enabled = true,
    icon = nil,
  }

  local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
  }

  local pos = function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local pos_in_percent = string.format("%3d", math.ceil(current_line * 100 / total_lines))
    return pos_in_percent .. "%%  %3l:%-2v"
  end

  local spaces = function()
    return "聾: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end

  lualine.setup {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = custom_powerline_dark,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      -- disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
      disabled_filetypes = { "alpha", "dashboard", "toggleterm" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { branch },
      lualine_c = { diagnostics },
      lualine_d = {
        {
          function()
            local fg = "#228b22" -- not modified
            if vim.bo.modified then
              fg = "#c70039" -- unsaved
            elseif not vim.bo.modifiable then
              fg = "#a70089"
            end -- readonly
            vim.cmd("hi! lualine_filename_status guifg=" .. fg)
            return "%m"
          end,
        },
      },
      lualine_x = { diff, lsp },
      lualine_y = { spaces, "encoding", filetype },
      lualine_z = { pos },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_d = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
end

return M
