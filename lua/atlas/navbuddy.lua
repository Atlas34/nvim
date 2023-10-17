local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    { 'neovim/nvim-lspconfig', event = "VeryLazy" },
    { 'SmiteshP/nvim-navic', event = "VeryLazy" },
    { 'MunifTanjim/nui.nvim', event = "VeryLazy" },
    { 'numToStr/Comment.nvim', event = "VeryLazy" }, -- Optional
    { 'nvim-telescope/telescope.nvim', event = "VeryLazy" }, -- Optional
  },
  keys = {
    { "<C-M>", "<cmd>Navbuddy<CR>" },
  },
}

function M.config()
  local status_ok, navbuddy = pcall(require, "nvim-navbuddy")
  if not status_ok then
    vim.notify("navbuddy plugin not found!")
    return nil
  end

  local status_ok_action, actions = pcall(require, "nvim-navbuddy.actions")
  if not status_ok_action then
    vim.notify("navbuddy plugin not found!")
    return nil
  end

  local icons = require 'atlas.icons'

  local myConfig = {
    window = {
      border = "rounded",  -- "rounded", "double", "solid", "none"
      -- or an array with eight chars building up the border in a clockwise fashion
      -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
      size = "60%",       -- Or table format example: { height = "40%", width = "100%"}
      position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
      scrolloff = nil,    -- scrolloff value within navbuddy window
      sections = {
        left = {
          size = "20%",
          border = nil, -- You can set border style for each section individually as well.
        },
        mid = {
          size = "40%",
          border = nil,
        },
        right = {
          -- No size option for right most section. It fills to
          -- remaining area.
          border = nil,
          preview = "leaf",  -- Right section can show previews too.
          -- Options: "leaf", "always" or "never"
        }
      },
    },
    node_markers = {
      enabled = true,
      icons = {
        leaf = "  ",
        leaf_selected = " " .. icons.misc.Right_Arrow .. " ",
        branch = " " .. icons.ui.ChevronRight,
      },
    },
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
    use_default_mappings = true,            -- If set to false, only mappings set
  -- by user are set. Else default
  -- mappings are used for keys
  -- that are not set by user
    mappings = {
      ["<esc>"] = actions.close(),        -- Close and cursor to original location
      ["q"] = actions.close(),

      ["j"] = actions.next_sibling(),     -- down
      ["k"] = actions.previous_sibling(), -- up

      ["h"] = actions.parent(),           -- Move to left panel
      ["l"] = actions.children(),         -- Move to right panel
      ["0"] = actions.root(),             -- Move to first panel

      ["v"] = actions.visual_name(),      -- Visual selection of name
      ["V"] = actions.visual_scope(),     -- Visual selection of scope

      ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
      ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

      ["i"] = actions.insert_name(),      -- Insert at start of name
      ["I"] = actions.insert_scope(),     -- Insert at start of scope

      ["a"] = actions.append_name(),      -- Insert at end of name
      ["A"] = actions.append_scope(),     -- Insert at end of scope

      ["r"] = actions.rename(),           -- Rename currently focused symbol

      ["d"] = actions.delete(),           -- Delete scope

      ["f"] = actions.fold_create(),      -- Create fold of current scope
      ["F"] = actions.fold_delete(),      -- Delete fold of current scope

      ["c"] = actions.comment(),          -- Comment out current scope

      ["<enter>"] = actions.select(),     -- Goto selected symbol
      ["o"] = actions.select(),

      ["J"] = actions.move_down(),        -- Move focused node down
      ["K"] = actions.move_up(),          -- Move focused node up

      ["s"] = actions.toggle_preview(),   -- Show preview of current node

      ["<C-v>"] = actions.vsplit(),       -- Open selected node in a vertical split
      ["<C-s>"] = actions.hsplit(),       -- Open selected node in a horizontal split

      ["t"] = actions.telescope({         -- Fuzzy finder at current level.
        layout_config = {               -- All options that can be
          height = 0.60,              -- passed to telescope.nvim's
          width = 0.60,               -- default can be passed here.
          prompt_position = "top",
          preview_width = 0.50
        },
        layout_strategy = "horizontal"
      }),

      ["g?"] = actions.help(),            -- Open mappings help window
    },
    lsp = {
      auto_attach = true,   -- If set to true, you don't need to manually use attach function
      preference = nil,      -- list of lsp server names in order of preference
    },
    source_buffer = {
      follow_node = true,    -- Keep the current node in focus on the source buffer
      highlight = true,      -- Highlight the currently focused node
      reorient = "smart",    -- "smart", "top", "mid" or "none"
      scrolloff = nil        -- scrolloff value when navbuddy is open
    }
  }

  -- Key Maps
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<C-M>", "<cmd>Navbuddy<CR>", opts)

  navbuddy.setup(myConfig)
end

return M
