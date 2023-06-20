local util = require("colorscheme.lib.util")

local _alacritty_template = {}

_alacritty_template.name = "alacritty"

_alacritty_template.path = "alacritty"
_alacritty_template.filename = "theme.yml"

_alacritty_template.gen = function(schema)
	local template = util.template(
		[[
# ${theme} for Alacritty
# ~/.config/alacritty/theme.yml
colors:
  primary:
    background: '${bg0}'
    foreground: '${fg}'
    dim_foreground: '${fg3}'
    bright_foreground: '${fg0}'
  cursor:
    text: '${bg}'
    cursor: '${fg0}'
  vi_mode_cursor:
    text: '${bg}'
    cursor: '${fg0}'
  search:
    matches:
      foreground: '${bg3}'
      background: '${magenta}'
    focused_match:
      foreground: '${magenta}'
      background: '${bg3}'
  hints:
    start:
      foreground: '${bg3}'
      background: '${yellow}'
    end:
      foreground: '${yellow}'
      background: '${bg3}'
  line_indicator:
    foreground: None
    background: None
  footer_bar:
    foreground: '${bg3}'
    background: '${magenta}'
  selection:
    text: '${fg}'
    background: '${bg4}'
  normal:
    black: '${black}'
    red: '${red}'
    green: '${green}'
    yellow: '${yellow}'
    blue: '${blue}'
    magenta: '${magenta}'
    cyan: '${cyan}'
    white: '${fg}'
  bright:
    black: '${black}'
    red: '${red}'
    green: '${green}'
    yellow: '${yellow}'
    blue: '${blue}'
    magenta: '${magenta}'
    cyan: '${cyan}'
    white: '${fg}']],
		schema
	)

	return template
end

return _alacritty_template
