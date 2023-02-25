local utils = require("colorscheme.utils")

local _imv_template = {}

_imv_template.name = "imv"

_imv_template.path = "imv"
_imv_template.filename = "config"

_imv_template.gen = function(schema)
	local template = utils.template(
		[[
# ▪  • ▌ ▄ ·.  ▌ ▐·
# ██ ·██ ▐███▪▪█·█▌
# ▐█·▐█ ▌▐▌▐█·▐█▐█•
# ▐█▌██ ██▌▐█▌ ███ 
# ▀▀▀▀▀ █▪▀▀▀. ▀  
# Created by: Dang Minh Ngo
# Github: @dangminhngo
# Email: dangminhngo.dev@gmail.com

# ${theme} for imv
# ~/.config/imv/config

# styling
[options]
background = ${bg1}
fullscreen = false
overlay = true
overlay_text_color = ${white}
overlay_background_color = ${bg2}
overlay_background_alpha = ff
overlay_font = Jetka:11
overlay_position_bottom = false

# bindings
[binds]
j = next
k = prev
    ]],
		schema
	)

	return template
end

return _imv_template
