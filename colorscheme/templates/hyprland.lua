local helpers = require("colorscheme.lib.helpers")

local _hyprland_template = {}

_hyprland_template.name = "hyprland"

_hyprland_template.path = "hypr"
_hyprland_template.filename = "palette.conf"

_hyprland_template.gen = function(schema)
	local sch = helpers.remove_hashtag_from_schema(schema)
	local template = helpers.template(
		[[
# ${theme} colorscheme for hyprland.conf

$none =     00000000
$accent =   ${accent}
$dark =     ${dark}
$bg0 =      ${bg0}
$bg =       ${bg}
$bg2 =      ${bg2}
$bg3 =      ${bg3}
$bg4 =      ${bg4}
$fg0 =      ${fg0}
$fg =       ${fg}
$fg2 =      ${fg2}
$fg3 =      ${fg3}
$black =    ${black}
$red =      ${red}
$orange =   ${orange}
$yellow =   ${yellow}
$green =    ${green}
$teal =     ${teal}
$cyan =     ${cyan}
$blue =     ${blue}
$magenta =  ${magenta}
$pink =     ${pink}
$white =    ${white}
$gray =     ${gray}]],
		sch
	)

	return template
end

return _hyprland_template
