-- to install use you package manager and install clang
-- (e.g sudo pacman -S clang)
return {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
  -- Required for lsp-status
  init_options = {
    clangdFileStatus = true,
  },
}
