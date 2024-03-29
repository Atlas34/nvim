local M = {
  'nvim-treesitter/nvim-treesitter',
  -- build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      'nvim-treesitter/playground',
      keys = {
      { "<F12>", "<cmd>TSPlaygroundToggle<CR>"},
      },
    },
    {
      'nvim-treesitter/nvim-treesitter-context',
      event = "VeryLazy",
    },
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      event = "VeryLazy",
    },
  }
}

function M.config()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    vim.notify("treesitter config Plugins not found!")
    return nil
  end

  -- local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
  -- ft_to_parser.motoko = "typescript"

  configs.setup({
    ensure_installed = { -- one of "all" or a list of languages
      "bash",
      "c",
      "cpp",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "typescript",
      "vim",
      "yaml",
    },
    sync_install = false,
    additional_vim_regex_highlighting = false,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      -- use_languagetree = true,
      enable = true, -- false will disable the whole extension
      -- disable = { "css", "html" }, -- list of language that will be disabled
      -- disable = { "css", "markdown" }, -- list of language that will be disabled
      -- additional_vim_regex_highlighting = true,
    },
    autopairs = {
      enable = true,
    },
    indent = {
      enable = true,
      -- disable = { "python", "css" }
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    autotag = {
      enable = true,
      disable = { "xml" },
    },
    rainbow = {
      enable = true,
      colors = {
        "Gold",
        "Orchid",
        "DodgerBlue",
        "Cornsilk",
        "Salmon",
        "LawnGreen",
      },
      disable = { "html" },
    },
    playground = {
      enable = true,
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },
  })
end

return M
