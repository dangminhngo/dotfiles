local util = require("theme.util")

local M = {}

M.name = "rofi"

M.path = "rofi"
M.filename = "theme.rasi"

M.gen = function(schema)
	local template = util.template(
		[[
/* ${theme} colorscheme for Rofi */
/* ~/.config/rofi/theme.rasi */

* {
  none:     #00000000;
  accent:   ${accent};
  bgd:      ${bgd};
  bg0:      ${bg0};
  bg:       ${bg};
  bg2:      ${bg2};
  bg3:      ${bg3};
  fg:       ${fg};
  fg2:      ${fg2};
  fg3:      ${fg3};
  black:    ${black};
  red:      ${red};
  orange:   ${orange};
  yellow:   ${yellow};
  green:    ${green};
  teal:     ${teal};
  cyan:     ${cyan};
  blue:     ${blue};
  purple:   ${purple};
  magenta:  ${magenta};
  white:    ${white};
}]],
		schema
	)

	return template
end

return M
