local util = require("theme.util")

local M = {}

M.name = "ags"

M.path = "ags"
M.filename = "palette.css"

M.gen = function(schema)
	local template = util.template(
		[[
/* ${theme} colorscheme for eww */
/* ~/.config/eww/palette.css */

@define-color accent   ${accent};
@define-color bgd      ${bgd};
@define-color bg0      ${bg0};
@define-color bg       ${bg};
@define-color bg2      ${bg2};
@define-color bg3      ${bg3};
@define-color fg       ${fg};
@define-color fg2      ${fg2};
@define-color fg3      ${fg3};
@define-color black    ${black};
@define-color red      ${red};
@define-color orange   ${orange};
@define-color yellow   ${yellow};
@define-color green    ${green};
@define-color teal     ${teal};
@define-color cyan     ${cyan};
@define-color blue     ${blue};
@define-color purple   ${purple};
@define-color magenta  ${magenta};
@define-color white    ${white};
]],
		schema
	)

	return template
end

return M
