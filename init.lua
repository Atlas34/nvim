require "atlas.global"

require "atlas.autocommands"

require "atlas.functions"

require "atlas.settings"
require "atlas.keymaps"
require "atlas.icons"

-- ----------
-- Plugins
-- ----------

-- Notification
Spec "atlas.notify"
Spec "atlas.dressing"
-- Spec "atlas.noice"

-- Themes
Spec 'atlas.just-black'

-- Status Line
Spec "atlas.lualine"

-- Buffer Line
Spec "atlas.tabline"

-- Telescope
Spec "atlas.telescope"

-- Treesitter
Spec "atlas.treesitter"

-- Indent Line
Spec "atlas.indentline"
Spec "atlas.mini-identscope"

-- TODO Comments
Spec "atlas.todo-comments"
Spec "atlas.colorizer"
Spec "atlas.illuminate"
Spec "atlas.nvim-tree"
Spec "atlas.toggleterm"
Spec "atlas.comment"
Spec "atlas.eyeliner"
Spec "atlas.project"
-- require "atlas.markdown"

-- Navic
-- Spec "atlas.navbuddy"
Spec "atlas.navic"

-- LSP
Spec "atlas.lsp.mason"
Spec "atlas.schemastore"
Spec "atlas.lsp"
Spec "atlas.lsp.lsp-signature"
Spec "atlas.lsp.null-ls"
Spec "atlas.lsp.lsp_lines"
Spec "atlas.fidget"

Spec "atlas.cmp"

-- Bookmarks
Spec "atlas.bookmarks"

-- Code Action
Spec "atlas.lightbulb"

-- Source Plugins
require "atlas.lazy"
