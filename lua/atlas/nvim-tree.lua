local M = {
  "nvim-tree/nvim-tree.lua",
  keys = {
    {"<leader>ee", "<cmd>NvimTreeToggle<CR>"},
    {"<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>"},
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
}

function M.config()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    vim.notify("nvim-tree plugin not found!")
    return nil
  end

  -- change color for arrows in tree to light blue
  vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
  vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

  local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
    vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

  end


  nvim_tree.setup {
    on_attach = my_on_attach,
    hijack_directories = {
      enable = false,
    },
    filters = {
      custom = { ".git" },
      exclude = { ".gitignore" },
    },
    update_cwd = true,
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
          folder = {
            arrow_open = "",
            arrow_closed = "",
            -- arrow_open = " ",
            -- arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      side = "left",
      -- auto_resize = true,
      number = false,
      relativenumber = false,
    },
  }

  -- set keymaps
  local keymap = vim.keymap -- for conciseness

  keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
  keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
end

return M
