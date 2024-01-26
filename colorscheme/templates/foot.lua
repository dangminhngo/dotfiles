local helpers = require("colorscheme.lib.helpers")

local _foot_template = {}

_foot_template.name = "foot"

_foot_template.path = "foot"
_foot_template.filename = "theme.ini"

_foot_template.gen = function(schema)
	local sch = helpers.remove_hashtag_from_schema(schema)
	local template = helpers.template(
		[[# ${theme} colorscheme for foot
# ~/.config/foot/theme.ini
[cursor]
style=block
color=${bg0} ${fg}
blink=no

[mouse]
hide-when-typing=yes

[colors]
alpha=1.0
background=${bg0}
foreground=${fg}

## Normal/regular colors (color palette 0-7)
regular0=${black}  # black
regular1=${red}  # red
regular2=${green}  # green
regular3=${yellow}  # yellow
regular4=${blue}  # blue
regular5=${magenta}  # magenta
regular6=${cyan}  # cyan
regular7=${white}  # white

## Bright colors (color palette 8-15)
bright0=${black}   # bright black
bright1=${red}   # bright red
bright2=${green}   # bright green
bright3=${yellow}   # bright yellow
bright4=${blue}   # bright blue
bright5=${magenta}   # bright magenta
bright6=${cyan}   # bright cyan
bright7=${white}   # bright white

## Misc colors
selection-foreground=${white}
selection-background=${bg3}
urls=${blue}
    ]],
		sch
	)

	return template
end

return _foot_template
