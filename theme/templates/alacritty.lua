local util = require("theme.util")

local M = {}

M.name = "alacritty"

M.path = "alacritty"
M.filename = "theme.toml"

M.gen = function(schema)
	local template = util.template(
		[[
# ${theme} for Alacritty
# ~/.config/alacritty/theme.toml
[colors.bright]
black = "${black}"
blue = "${blue}"
cyan = "${cyan}"
green = "${green}"
magenta = "${magenta}"
red = "${red}"
white = "${white}"
yellow = "${yellow}"

[colors.cursor]
cursor = "${fg}"
text = "${bg}"

[colors.footer_bar]
background = "${fg2}"
foreground = "${bg0}"

[colors.hints.end]
background = "${bg0}"
foreground = "${fg3}"

[colors.hints.start]
background = "${fg2}"
foreground = "${bg0}"

[colors.line_indicator]
background = "None"
foreground = "None"

[colors.normal]
black = "${black}"
blue = "${blue}"
cyan = "${cyan}"
green = "${green}"
magenta = "${magenta}"
red = "${red}"
white = "${white}"
yellow = "${yellow}"

[colors.primary]
background = "${bg0}"
bright_foreground = "${fg}"
dim_foreground = "${fg2}"
foreground = "${fg}"

[colors.search.focused_match]
background = "${accent}"
foreground = "${bg}"

[colors.search.matches]
background = "${red}"
foreground = "${white}"

[colors.selection]
background = "${bg2}"
text = "${fg}"

[colors.vi_mode_cursor]
cursor = "${white}"
text = "${bg}"
    ]],
		schema
	)

	return template
end

return M
