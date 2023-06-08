local color = require("colorscheme.lib.color")

local fg = "#abc2d0"
local bg = "#10181d"

return {
	theme = "Proxima",
	palette = {
		-- Accent color
		accent = "#a4c76f",
		-- Backgrounds & Foregrounds
		dark = color.darken(bg, 40),
		bg0 = color.darken(bg, 16),
		bg = bg,
		bg2 = color.lighten(bg, 4),
		bg3 = color.lighten(bg, 8),
		bg4 = color.lighten(bg, 12),
		fg0 = color.lighten(fg, 56),
		fg = fg,
		fg2 = color.darken(fg, 16),
		fg3 = color.darken(fg, 32),
		fg4 = color.darken(fg, 48),
		-- Palette
		red = "#f15a5d",
		green = "#a4c76f",
		yellow = "#eace60",
		blue = "#619af5",
		magenta = "#9d78d1",
		cyan = "#42b8e6",
		teal = "#72c2b2",
		orange = "#e39d5f",
		pink = "#d983d7",
		black = color.lighten(bg, 18),
		gray = color.lighten(bg, 32),
		white = color.lighten(fg, 64),
	},
}
