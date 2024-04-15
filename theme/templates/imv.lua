local util = require("theme.util")

local M = {}

M.name = "imv"

M.path = "imv"
M.filename = "config"

M.gen = function(schema)
	local template = util.template(
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
background = ${bg}
fullscreen = false
overlay = true
overlay_text_color = ${white}
overlay_background_color = ${bg2}
overlay_background_alpha = ff
overlay_font = Jetka Nerd Font Extended:11
overlay_position_bottom = false

# bindings
[binds]
j = next
k = prev]],
		schema
	)

	return template
end

return M
