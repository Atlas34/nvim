local status_ok, justBlack = pcall(require, "just-black")
if not status_ok then
	vim.notify("JustBlack Plugins not found!")
  return nil
end

justBlack.setup({})

