local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap , as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>,", ":bp<CR>", opts)
keymap("n", "<leader>.", ":bn<CR>", opts)
keymap("n", "<leader>/", ":bd<CR>", opts)

-- Move text up and down
-- Normal --
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- edit pluggins file
keymap("", "<leader>ep", ":e! ${HOME}/.config/nvim/lua/atlas/plugins.lua<cr>", opts)

-- edit init.lua
keymap("", "<leader>ev", ":e! ${HOME}/.config/nvim/init.lua<cr>", opts)

-- Reload init.lua
keymap("", "<leader>er", ":source ${HOME}/.config/nvim/init.lua<cr>", opts)

-- clear highlighted search
keymap("n", "<leader><sapce>", ":nohlsearch<CR>", opts)

-- activate spell-checking alternative
keymap("n", ";s", ":set invspell spelllang=en<cr>", opts)

-- Horizontal Split
keymap("n", "<leader>-", ":split<cr>", opts)

-- Vertical Split
keymap("n", "<leader>|", ":vsplit<cr>", opts)

-- Space will fold back
keymap("n", "<space>", "za", opts)

-- switch between current and last buffer
keymap("n", "<leader>;", "<C-^>", opts)

-- Toggle Number
keymap("n", "<F2>", ":set nu!<CR>", opts)

-- Toggle Paste
keymap("n", "<F3>", ":set paste!<CR>", opts)

keymap("n", "<F6>", [[:TSHighlightCapturesUnderCursor<CR>]], opts)

-- LSP
keymap("n", "<leader>l", ":lua vim.lsp.buf.format()<cr>", opts)

