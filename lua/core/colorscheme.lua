-- Set Colorscheme
local status, err = pcall(function()
	vim.cmd("colorscheme gruvbox") -- onedark -- kanagawa -- kanagawa-dragon
end)

if not status then
	print("Error setting colorscheme: " .. err)
	return
end
