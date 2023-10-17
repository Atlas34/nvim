CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
LAZY_PLUGIN_SPEC = {}

function Dump(var) return print(vim.inspect(var)) end

function Spec(item) table.insert(LAZY_PLUGIN_SPEC, { import = item }) end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
