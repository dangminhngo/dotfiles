local color = require("colorscheme.lib.color")

local bg = "#242d2f"
local fg = "#bbc8cb"

return {
	theme = "Proxima",
	palette = {
		-- Accent color
		accent = "#a4c76f",
		-- Backgrounds & Foregrounds
		dark = color.darken(bg, 48),
		bg0 = color.darken(bg, 16),
		bg = bg,
		bg2 = color.lighten(bg, 4),
		bg3 = color.lighten(bg, 8),
		bg4 = color.lighten(bg, 12),
		fg0 = color.lighten(fg, 40),
		fg = fg,
		fg2 = color.darken(fg, 12),
		fg3 = color.darken(fg, 24),
		fg4 = color.darken(fg, 36),
		-- Palette
		red = "#e3787c",
		green = "#a4c76f",
		yellow = "#ddd764",
		blue = "#6e99de",
		magenta = "#b08be4",
		cyan = "#66c5cc",
		teal = "#5ad8aa",
		orange = "#e39754",
		pink = "#d676c3",
		black = color.lighten(bg, 20),
		gray = color.lighten(bg, 28),
		white = color.lighten(fg, 64),
	},
}
