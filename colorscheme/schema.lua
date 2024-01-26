local color = require("colorscheme.color")

local builtin = {
	fg = "#c5d5df",
	bg = "#0d1418",
	red = "#e46769",
	green = "#a4c76f",
	yellow = "#eace60",
	blue = "#619af5",
	magenta = "#9d78d1",
	cyan = "#42b8e6",
	teal = "#5fd7aa",
	orange = "#e39d5f",
	pink = "#d983d7",
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
		bg2 = color.rel_lighten(builtin.bg, 0.02),
		bg3 = color.rel_lighten(builtin.bg, 0.06),
		bg4 = color.rel_lighten(builtin.bg, 0.1),
		fg0 = color.rel_lighten(builtin.fg, 0.64),
		fg2 = color.rel_darken(builtin.fg, 0.16),
		fg3 = color.rel_darken(builtin.fg, 0.32),
		fg4 = color.rel_darken(builtin.fg, 0.48),
		black = color.rel_lighten(builtin.bg, 0.18),
		gray = color.rel_lighten(builtin.bg, 0.32),
		white = color.rel_lighten(builtin.fg, 0.64),
	},
}
