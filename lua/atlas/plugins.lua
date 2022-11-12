vim.cmd "filetype off"

vim.cmd "call plug#begin('~/.config/nvim/plugged')"

-- Icons
-- vim.cmd "Plug 'kyazdani42/nvim-web-devicons'" -- Icons without colors
vim.cmd "Plug 'nvim-tree/nvim-web-devicons'" -- Icons with colors

-- Status Bar
vim.cmd "Plug 'nvim-lualine/lualine.nvim'"

-- File Explorer
vim.cmd "Plug 'kyazdani42/nvim-tree.lua'"

-- Treesitter
vim.cmd "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}"
vim.cmd "Plug 'nvim-treesitter/nvim-treesitter-context'"
vim.cmd "Plug 'nvim-treesitter/playground'"

-- Display colors
vim.cmd "Plug 'norcalli/nvim-colorizer.lua'"

--bufferLine
-- vim.cmd "Plug 'akinsho/bufferline.nvim'"
vim.cmd "Plug 'kdheepak/tabline.nvim'"

--Illuminate
vim.cmd "Plug 'RRethy/vim-illuminate'"

--Notif
vim.cmd "Plug 'rcarriga/nvim-notify'"

-- TODO Comments
vim.cmd "Plug 'folke/todo-comments.nvim'"

-- Comments
vim.cmd "Plug 'numToStr/Comment.nvim'"

-- Markdown
vim.cmd "Plug 'tpope/vim-markdown'"

-- Telescope
vim.cmd "Plug 'nvim-lua/popup.nvim'"
vim.cmd "Plug 'nvim-lua/plenary.nvim'"
vim.cmd "Plug 'nvim-telescope/telescope.nvim'"
vim.cmd "Plug 'tom-anders/telescope-vim-bookmarks.nvim'"
vim.cmd "Plug 'nvim-telescope/telescope-fzy-native.nvim'"

--LSP
-- simple to use language server installer
-- vim.cmd "Plug 'williamboman/nvim-lsp-installer'"
vim.cmd "Plug 'williamboman/mason.nvim'"
vim.cmd "Plug 'williamboman/mason-lspconfig.nvim'"
vim.cmd "Plug 'neovim/nvim-lspconfig'"
-- language server settings defined in json for
vim.cmd "Plug 'tamago324/nlsp-settings.nvim'"
-- for formatters and linters
vim.cmd "Plug 'jose-elias-alvarez/null-ls.nvim'"
vim.cmd "Plug 'filipdutescu/renamer.nvim'"
vim.cmd "Plug 'ray-x/lsp_signature.nvim'"
vim.cmd "Plug 'simrat39/symbols-outline.nvim'"
vim.cmd "Plug 'b0o/SchemaStore.nvim'"
vim.cmd "Plug 'Maan2003/lsp_lines.nvim'"

-- lua development
vim.cmd "Plug 'folke/neodev.nvim'"

-- Completion
vim.cmd "Plug 'hrsh7th/nvim-cmp'"
vim.cmd "Plug 'hrsh7th/cmp-buffer'"
vim.cmd "Plug 'hrsh7th/cmp-path'"
vim.cmd "Plug 'hrsh7th/cmp-nvim-lua'"
vim.cmd "Plug 'hrsh7th/cmp-nvim-lsp'"
vim.cmd "Plug 'hrsh7th/cmp-cmdline'"
vim.cmd "Plug 'saadparwaiz1/cmp_luasnip'"
vim.cmd "Plug 'L3MON4D3/LuaSnip'"

-- navic
--vim.cmd "Plug 'SmiteshP/nvim-gps'"
vim.cmd "Plug 'SmiteshP/nvim-navic'"

-- Bookmarks
vim.cmd "Plug 'MattesGroeger/vim-bookmarks'"

-- Improve loading time
vim.cmd "Plug 'lewis6991/impatient.nvim'"

-- Open Terminal
vim.cmd "Plug 'akinsho/toggleterm.nvim'"

vim.cmd "call plug#end()"
vim.cmd "filetype plugin indent on"
