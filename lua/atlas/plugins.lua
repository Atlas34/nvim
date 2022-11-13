local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  snapshot_path = vim.fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use 'wbthomason/packer.nvim' -- Have packer man

  -- Icons
  use 'nvim-tree/nvim-web-devicons' -- Icons with colors

  -- Status Bar
  use 'nvim-lualine/lualine.nvim'

-- File Explorer
use 'kyazdani42/nvim-tree.lua'

-- Treesitter
use 'nvim-treesitter/nvim-treesitter'
use 'nvim-treesitter/nvim-treesitter-context'
use 'nvim-treesitter/playground'

-- Display colors
use 'norcalli/nvim-colorizer.lua'

--bufferLine
use 'kdheepak/tabline.nvim'

--Illuminate
use 'RRethy/vim-illuminate'

--Notif
use 'rcarriga/nvim-notify'

-- TODO Comments
use 'folke/todo-comments.nvim'

-- Comments
use 'numToStr/Comment.nvim'

-- Markdown
use 'tpope/vim-markdown'

-- Telescope
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'tom-anders/telescope-vim-bookmarks.nvim'
use 'nvim-telescope/telescope-fzy-native.nvim'

--LSP
-- simple to use language server installer
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'
-- language server settings defined in json for
use 'tamago324/nlsp-settings.nvim'
-- for formatters and linters
use 'jose-elias-alvarez/null-ls.nvim'
use 'filipdutescu/renamer.nvim'
use 'ray-x/lsp_signature.nvim'
use 'simrat39/symbols-outline.nvim'
use 'b0o/SchemaStore.nvim'
use 'Maan2003/lsp_lines.nvim'
-- lua development
use 'folke/neodev.nvim'

-- Completion
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-nvim-lua'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-cmdline'
use 'saadparwaiz1/cmp_luasnip'
use 'L3MON4D3/LuaSnip'

-- navic
use 'SmiteshP/nvim-navic'
--
-- Bookmarks
use 'MattesGroeger/vim-bookmarks'

-- Improve loading time
use 'lewis6991/impatient.nvim'

-- Open Terminal
use 'akinsho/toggleterm.nvim'

if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

  -- vim.cmd "filetype off"
--
-- vim.cmd "call plug#begin('~/.config/nvim/plugged')"
--
-- -- Icons
-- -- vim.cmd "Plug 'kyazdani42/nvim-web-devicons'" -- Icons without colors
-- vim.cmd "Plug 'nvim-tree/nvim-web-devicons'" -- Icons with colors
--
-- -- Status Bar
-- vim.cmd "Plug 'nvim-lualine/lualine.nvim'"
--
-- -- File Explorer
-- vim.cmd "Plug 'kyazdani42/nvim-tree.lua'"
--
-- -- Treesitter
-- vim.cmd "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}"
-- vim.cmd "Plug 'nvim-treesitter/nvim-treesitter-context'"
-- vim.cmd "Plug 'nvim-treesitter/playground'"
--
-- -- Display colors
-- vim.cmd "Plug 'norcalli/nvim-colorizer.lua'"
--
-- --bufferLine
-- -- vim.cmd "Plug 'akinsho/bufferline.nvim'"
-- vim.cmd "Plug 'kdheepak/tabline.nvim'"
--
-- --Illuminate
-- vim.cmd "Plug 'RRethy/vim-illuminate'"
--
-- --Notif
-- vim.cmd "Plug 'rcarriga/nvim-notify'"
--
-- -- TODO Comments
-- vim.cmd "Plug 'folke/todo-comments.nvim'"
--
-- -- Comments
-- vim.cmd "Plug 'numToStr/Comment.nvim'"
--
-- -- Markdown
-- vim.cmd "Plug 'tpope/vim-markdown'"
--
-- -- Telescope
-- vim.cmd "Plug 'nvim-lua/popup.nvim'"
-- vim.cmd "Plug 'nvim-lua/plenary.nvim'"
-- vim.cmd "Plug 'nvim-telescope/telescope.nvim'"
-- vim.cmd "Plug 'tom-anders/telescope-vim-bookmarks.nvim'"
-- vim.cmd "Plug 'nvim-telescope/telescope-fzy-native.nvim'"
--
-- --LSP
-- -- simple to use language server installer
-- -- vim.cmd "Plug 'williamboman/nvim-lsp-installer'"
-- vim.cmd "Plug 'williamboman/mason.nvim'"
-- vim.cmd "Plug 'williamboman/mason-lspconfig.nvim'"
-- vim.cmd "Plug 'neovim/nvim-lspconfig'"
-- -- language server settings defined in json for
-- vim.cmd "Plug 'tamago324/nlsp-settings.nvim'"
-- -- for formatters and linters
-- vim.cmd "Plug 'jose-elias-alvarez/null-ls.nvim'"
-- vim.cmd "Plug 'filipdutescu/renamer.nvim'"
-- vim.cmd "Plug 'ray-x/lsp_signature.nvim'"
-- vim.cmd "Plug 'simrat39/symbols-outline.nvim'"
-- vim.cmd "Plug 'b0o/SchemaStore.nvim'"
-- vim.cmd "Plug 'Maan2003/lsp_lines.nvim'"
--
-- -- lua development
-- vim.cmd "Plug 'folke/neodev.nvim'"
--
-- -- Completion
-- vim.cmd "Plug 'hrsh7th/nvim-cmp'"
-- vim.cmd "Plug 'hrsh7th/cmp-buffer'"
-- vim.cmd "Plug 'hrsh7th/cmp-path'"
-- vim.cmd "Plug 'hrsh7th/cmp-nvim-lua'"
-- vim.cmd "Plug 'hrsh7th/cmp-nvim-lsp'"
-- vim.cmd "Plug 'hrsh7th/cmp-cmdline'"
-- vim.cmd "Plug 'saadparwaiz1/cmp_luasnip'"
-- vim.cmd "Plug 'L3MON4D3/LuaSnip'"
--
-- -- navic
-- --vim.cmd "Plug 'SmiteshP/nvim-gps'"
-- vim.cmd "Plug 'SmiteshP/nvim-navic'"
--
-- -- Bookmarks
-- vim.cmd "Plug 'MattesGroeger/vim-bookmarks'"
--
-- -- Improve loading time
-- vim.cmd "Plug 'lewis6991/impatient.nvim'"
--
-- -- Open Terminal
-- vim.cmd "Plug 'akinsho/toggleterm.nvim'"
--
-- vim.cmd "call plug#end()"
-- vim.cmd "filetype plugin indent on"
-- vim.cmd "filetype off"
--
-- vim.cmd "call plug#begin('~/.config/nvim/plugged')"
--
-- -- Icons
-- -- vim.cmd "Plug 'kyazdani42/nvim-web-devicons'" -- Icons without colors
-- vim.cmd "Plug 'nvim-tree/nvim-web-devicons'" -- Icons with colors
--
-- -- Status Bar
-- vim.cmd "Plug 'nvim-lualine/lualine.nvim'"
--
-- -- File Explorer
-- vim.cmd "Plug 'kyazdani42/nvim-tree.lua'"
--
-- -- Treesitter
-- vim.cmd "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}"
-- vim.cmd "Plug 'nvim-treesitter/nvim-treesitter-context'"
-- vim.cmd "Plug 'nvim-treesitter/playground'"
--
-- -- Display colors
-- vim.cmd "Plug 'norcalli/nvim-colorizer.lua'"
--
-- --bufferLine
-- -- vim.cmd "Plug 'akinsho/bufferline.nvim'"
-- vim.cmd "Plug 'kdheepak/tabline.nvim'"
--
-- --Illuminate
-- vim.cmd "Plug 'RRethy/vim-illuminate'"
--
-- --Notif
-- vim.cmd "Plug 'rcarriga/nvim-notify'"
--
-- -- TODO Comments
-- vim.cmd "Plug 'folke/todo-comments.nvim'"
--
-- -- Comments
-- vim.cmd "Plug 'numToStr/Comment.nvim'"
--
-- -- Markdown
-- vim.cmd "Plug 'tpope/vim-markdown'"
--
-- -- Telescope
-- vim.cmd "Plug 'nvim-lua/popup.nvim'"
-- vim.cmd "Plug 'nvim-lua/plenary.nvim'"
-- vim.cmd "Plug 'nvim-telescope/telescope.nvim'"
-- vim.cmd "Plug 'tom-anders/telescope-vim-bookmarks.nvim'"
-- vim.cmd "Plug 'nvim-telescope/telescope-fzy-native.nvim'"
--
-- --LSP
-- -- simple to use language server installer
-- -- vim.cmd "Plug 'williamboman/nvim-lsp-installer'"
-- vim.cmd "Plug 'williamboman/mason.nvim'"
-- vim.cmd "Plug 'williamboman/mason-lspconfig.nvim'"
-- vim.cmd "Plug 'neovim/nvim-lspconfig'"
-- -- language server settings defined in json for
-- vim.cmd "Plug 'tamago324/nlsp-settings.nvim'"
-- -- for formatters and linters
-- vim.cmd "Plug 'jose-elias-alvarez/null-ls.nvim'"
-- vim.cmd "Plug 'filipdutescu/renamer.nvim'"
-- vim.cmd "Plug 'ray-x/lsp_signature.nvim'"
-- vim.cmd "Plug 'simrat39/symbols-outline.nvim'"
-- vim.cmd "Plug 'b0o/SchemaStore.nvim'"
-- vim.cmd "Plug 'Maan2003/lsp_lines.nvim'"
--
-- -- lua development
-- vim.cmd "Plug 'folke/neodev.nvim'"
--
-- -- Completion
-- vim.cmd "Plug 'hrsh7th/nvim-cmp'"
-- vim.cmd "Plug 'hrsh7th/cmp-buffer'"
-- vim.cmd "Plug 'hrsh7th/cmp-path'"
-- vim.cmd "Plug 'hrsh7th/cmp-nvim-lua'"
-- vim.cmd "Plug 'hrsh7th/cmp-nvim-lsp'"
-- vim.cmd "Plug 'hrsh7th/cmp-cmdline'"
-- vim.cmd "Plug 'saadparwaiz1/cmp_luasnip'"
-- vim.cmd "Plug 'L3MON4D3/LuaSnip'"
--
-- -- navic
-- --vim.cmd "Plug 'SmiteshP/nvim-gps'"
-- vim.cmd "Plug 'SmiteshP/nvim-navic'"
--
-- -- Bookmarks
-- vim.cmd "Plug 'MattesGroeger/vim-bookmarks'"
--
-- -- Improve loading time
-- vim.cmd "Plug 'lewis6991/impatient.nvim'"
--
-- -- Open Terminal
-- vim.cmd "Plug 'akinsho/toggleterm.nvim'"
--
-- vim.cmd "call plug#end()"
-- vim.cmd "filetype plugin indent on"
