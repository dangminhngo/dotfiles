local templates = {
	"ags",
	"alacritty",
	"btop",
	"dunst",
	"fish",
	"foot",
	"hyprland",
	"imv",
	"rofi",
	"sugar-candy",
	"zathura",
}

local modules = {}

for _, t in ipairs(templates) do
	modules[t] = require("theme.templates." .. t)
end

return modules
