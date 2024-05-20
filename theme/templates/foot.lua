local util = require("theme.util")

local M = {}

M.name = "foot"

M.path = "foot"
M.filename = "theme.ini"

M.gen = function(schema)
	local sch = util.remove_hashtag_from_schema(schema)
	local template = util.template(
		[[
# ${theme} for foot
# ~/.config/foot/theme.ini
[colors]
alpha=1.0
background=${bg0}
foreground=${fg}
flash=${fg3}
flash-alpha=0.5

## Normal/regular colors (color palette 0-7)
regular0=${bg}  # black
regular1=${red}  # red
regular2=${green}  # green
regular3=${yellow}  # yellow
regular4=${blue}  # blue
regular5=${magenta}  # magenta
regular6=${cyan}  # cyan
regular7=${fg}  # white

## Bright colors (color palette 8-15)
bright0=${black}   # bright black
bright1=${red2}   # bright red
bright2=${green2}   # bright green
bright3=${yellow2}   # bright yellow
bright4=${blue2}   # bright blue
bright5=${magenta2}   # bright magenta
bright6=${cyan2}   # bright cyan
bright7=${fg}   # bright white
]],
		sch
	)

	return template
end

return M
