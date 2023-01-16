return {
  -- Icons
  'nvim-tree/nvim-web-devicons', -- Icons with colors

  {
    'nvim-lua/popup.nvim',
    lazy = true,
  },
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },

  -- Theme: Just-Black
  "Atlas34/just-black.nvim",

  -- Status Bar
  'nvim-lualine/lualine.nvim',

  -- Treesitter
  {
    'nvim-treesitter/playground',
    lazy = true
  },
  {
      'nvim-treesitter/nvim-treesitter-context',
    lazy = true,
  },
  {
      'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
  },

  -- Display colors
  'norcalli/nvim-colorizer.lua',

  --bufferLine
  'kdheepak/tabline.nvim',

  --Illuminate
  'RRethy/vim-illuminate',

  --Notif
  'rcarriga/nvim-notify',

  -- TODO Comments
  'folke/todo-comments.nvim',

  -- Comments
  {
    'numToStr/Comment.nvim',
    lazy = true
  },

  -- Markdown
  'tpope/vim-markdown',

  -- Telescope
  {
    'tom-anders/telescope-vim-bookmarks.nvim',
    lazy = true,
  },
  {
    'nvim-telescope/telescope-fzy-native.nvim',
    lazy = true,
  },

  --LSP
  -- simple to language server installer
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- language server settings defined in json for
      'tamago324/nlsp-settings.nvim',
      -- for formatters and linters
      'jose-elias-alvarez/null-ls.nvim',
      'filipdutescu/renamer.nvim',
      'ray-x/lsp_signature.nvim',
      'simrat39/symbols-outline.nvim',
      'b0o/SchemaStore.nvim',
      'Maan2003/lsp_lines.nvim',
      'j-hui/fidget.nvim',
      -- lua development
      'folke/neodev.nvim',
    },
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
  },

  -- navic
  'SmiteshP/nvim-navic',
  --
  -- Bookmarks
  {
    'MattesGroeger/vim-bookmarks',
    lazy = true,
  },

  -- Improve loading time
  'lewis6991/impatient.nvim',

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },
}
