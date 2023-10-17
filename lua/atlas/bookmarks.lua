local icons = require "atlas.icons"
local M = {
  'tomasky/bookmarks.nvim',
  keys = {
    {"mm", '<cmd>lua require "bookmarks".bookmark_toggle()<CR>' },
    {"mn", '<cmd>lua require "bookmarks".bookmark_ann()<CR>' },
    {"mc", '<cmd>lua require "bookmarks".bookmark_clean()<CR>' },
  },
}

function M.config()
    -- Colors
    local hl = vim.api.nvim_set_hl
    hl(0, "BookMarksAdd", { fg = '#0077ff', bg = 'NONE' })
    hl(0, "BookMarksAddNr", { fg = 'NONE', bg = '#0c197a' })
    hl(0, "BookMarksAddLn", { fg = 'NONE', bg = '#0c197a' })
    hl(0, "BookMarksAnn", { fg = '#00f7c6', bg = 'NONE' })
    hl(0, "BookMarksAnnNr", { fg = 'NONE', bg = '#0c7a3e' })
    hl(0, "BookMarksAnnLn", { fg = 'NONE', bg = '#0c7a3e' })

  require('bookmarks').setup {
    -- sign_priority = 8,  --set bookmark sign priority to cover other sign
    save_file = vim.fn.expand "$HOME/.config/nvim/.bookmarks", -- bookmarks save file path

    keywords =  {
      ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
      ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
    },
    signs = {
      add = { hl = "BookMarksAdd", text = icons.ui.Flag, numhl = "BookMarksAddNr", linehl =  "BookMarksAddLn"},
      ann = { hl = "BookMarksAnn", text = icons.ui.Pin, numhl = "BookMarksAnnNr", linehl = "BookMarksAnnLn"},
    },
    linehl = true,
    numhl = true,
    on_attach = function(_)
      local bm = require "bookmarks"
      local map = vim.keymap.set
      map("n","mm",bm.bookmark_toggle) -- add or remove bookmark at current line
      map("n","mn",bm.bookmark_ann) -- add or edit mark annotation at current line
      map("n","mc",bm.bookmark_clean) -- clean all marks in local buffer
      map("n","m,",bm.bookmark_next) -- jump to next mark in local buffer
      map("n","m.",bm.bookmark_prev) -- jump to previous mark in local buffer
      map("n","m/",":Telescope bookmarks list<CR>") -- show marked file list in quickfix window
    end
  }
end

return M
