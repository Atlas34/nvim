filetype off

call plug#begin('~/.config/nvim/plugged')

" Icons
"Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-lualine/lualine.nvim'
"Plug 'mkitt/tabline.vim'

" Explorer
"Plug 'kyazdani42/nvim-tree.lua'

" Display Colors
"Plug 'ap/vim-css-color'

"treesitter (syntax Hilighting)
"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'windwp/nvim-ts-autotag'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'tpope/vim-commentary'
"Plug 'vim-scripts/taglist.vim'
"Plug 'benmills/vimux'
"Plug 'derekwyatt/vim-fswitch'
"Plug 'scrooloose/syntastic'

" Telescope
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Asciidoctor
"Plug 'habamax/vim-asciidoctor'

"Plug 'MarcWeber/vim-addon-mw-utils'| Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate'
" Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes'

" language-specific plugins
" Plug 'mattn/emmet-vim', { 'for': 'html' }
" Plug 'othree/html5.vim', { 'for': 'html' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'elzr/vim-json', { 'for': 'json' }
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'ap/vim-css-color', { 'for': 'css' }
" Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
"Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" Intellisense
"Plug 'neovim/nvim-lspconfig'
"Plug 'kabouzeid/nvim-lspinstall'
"Plug 'hrsh7th/nvim-compe'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'onsails/lspkind-nvim'
"Plug 'folke/lsp-colors.nvim'

call plug#end()
filetype plugin indent on
