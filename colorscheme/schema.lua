local color = require("colorscheme.lib.color")

local bg = "#262f32"
local fg = "#d4cbb8"

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
    red = "#e67e80",
    green = "#a4c76f",
    yellow = "#d1cc66",
    blue = "#678dc9",
    magenta = "#a183cc",
    cyan = "#76bfc4",
    teal = "#6fc7a4",
    orange = "#d69760",
    pink = "#c975b9",
		black = color.lighten(bg, 20),
		gray = color.lighten(bg, 28),
		white = color.lighten(fg, 64),
	},
}
