local utils = require("colorscheme.utils")

local _eww_template = {}

_eww_template.name = "eww"

_eww_template.path = "eww"
_eww_template.filename = "palette.scss"

_eww_template.gen = function(schema)
	local template = utils.template(
		[[
/* ${theme} colorscheme for eww */
/* ~/.config/eww/palette.scss */

$accent:   ${accent};
$bg0:      ${bg0};
$bg1:      ${bg1};
$bg2:      ${bg2};
$bg3:      ${bg3};
$bg4:      ${bg4};
$fg0:      ${fg0};
$fg1:      ${fg1};
$fg2:      ${fg2};
$fg3:      ${fg3};
$black:    ${black};
$red:      ${red};
$orange:   ${orange};
$yellow:   ${yellow};
$green:    ${green};
$teal:     ${teal};
$cyan:     ${cyan};
$blue:     ${blue};
$magenta:  ${magenta};
$purple:   ${purple};
$white:    ${white};
$gray:     ${gray};
    ]],
		schema
	)

	return template
end

return _eww_template
