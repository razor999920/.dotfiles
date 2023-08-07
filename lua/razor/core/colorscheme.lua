-- Set Colorscheme
local status, err = pcall(function()
	vim.cmd("colorscheme kanagawa")
end)

if not status then
	print("Error setting colorscheme: " .. err)
	return
end
