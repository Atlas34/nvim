local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("lualine Plugins not found!")
  return
end

--local status_gps_ok, gps = pcall(require, "nvim-gps")
--if not status_gps_ok then
  --vim.notify("nvim-gps Plugins not found!")
  --return
--end

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
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

local diff = {
  "diff",
  colored = false,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
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
  icons_enabled = false,
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

--local nvim_gps = function()
  --local gps_location = gps.get_location()
  --if gps_location == "error" then
    --return ""
  --else
    --return gps.get_location()
  --end
--end

local custom_powerline_dark = require'lualine.themes.powerline_dark'

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
    -- lualine_a = { branch, diagnostics },
    lualine_a = {mode},
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
          -- return "%t %m"
          return "%m"
        end,
        -- color = "lualine_filename_status",
      },
    },
    -- lualine_c = {},
    -- lualine_c = {
    --   { nvim_gps, cond = hide_in_width },
    -- },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { },
    lualine_y = { diff, spaces, "encoding", filetype },
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

