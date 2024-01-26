local helpers = require("colorscheme.lib.helpers")

local _rofi_template = {}

_rofi_template.name = "rofi"

_rofi_template.path = "rofi"
_rofi_template.filename = "theme.rasi"

_rofi_template.gen = function(schema)
	local template = helpers.template(
		[[
/* ${theme} colorscheme for Rofi */
/* ~/.config/rofi/theme.rasi */

* {
  none:     #00000000;
  accent:   ${accent};
  dark:     ${dark};
  bg0:      ${bg0};
  bg:       ${bg};
  bg2:      ${bg2};
  bg3:      ${bg3};
  bg4:      ${bg4};
  fg0:      ${fg0};
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
  magenta:  ${magenta};
  pink:     ${pink};
  white:    ${white};
  gray:     ${gray};
}]],
		schema
	)

	return template
end

return _rofi_template
