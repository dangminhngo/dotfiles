local color = require("colorscheme.color")

local builtin = {
	fg = "#cfc7c2",
	bg = "#242b2f",
	red = "#e67e80",
	green = "#a7c080",
	yellow = "#dbbc7f",
	blue = "#6c86db",
	magenta = "#b495d3",
	cyan = "#76b4cc",
	teal = "#76cca1",
	orange = "#e69875",
	pink = "#d699b6",
}

return {
	theme = "Crux Alpha Green",
	palette = {
		-- Accent color
		accent = builtin.green,
		fg = builtin.fg,
		bg = builtin.bg,
		red = builtin.red,
		green = builtin.green,
		yellow = builtin.yellow,
		blue = builtin.blue,
		magenta = builtin.magenta,
		cyan = builtin.cyan,
		teal = builtin.teal,
		orange = builtin.orange,
		pink = builtin.pink,
		-- Backgrounds & Foregrounds
		dark = color.rel_darken(builtin.bg, 0.32),
		bg0 = color.rel_darken(builtin.bg, 0.16),
		bg2 = color.rel_lighten(builtin.bg, 0.04),
		bg3 = color.rel_lighten(builtin.bg, 0.08),
		bg4 = color.rel_lighten(builtin.bg, 0.12),
		fg0 = color.rel_lighten(builtin.fg, 0.64),
		fg2 = color.rel_darken(builtin.fg, 0.16),
		fg3 = color.rel_darken(builtin.fg, 0.32),
		fg4 = color.rel_darken(builtin.fg, 0.48),
		black = color.rel_lighten(builtin.bg, 0.18),
		gray = color.rel_lighten(builtin.bg, 0.32),
		white = color.rel_lighten(builtin.fg, 0.64),
	},
}
