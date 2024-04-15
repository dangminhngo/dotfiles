local util = require("theme.util")

local M = {}

M.name = "fish"

M.path = "fish/conf.d"
M.filename = "theme.fish"

M.gen = function(schema)
	local sch = util.remove_hashtag_from_schema(schema)
	local template = util.template(
		[[
# ${theme} colorscheme for Fish
# ~/.config/fish/conf.d/theme.fish

# --> special
set -l fg ${fg}
set -l sel ${bg3}

# --> palette
set -l red ${red}
set -l green ${green}
set -l yellow ${yellow}
set -l orange ${orange}
set -l blue ${blue}
set -l purple ${purple}
set -l magenta ${magenta}
set -l cyan ${cyan}
set -l black ${black}

# Syntax Highlighting
set -g fish_color_normal $fg
set -g fish_color_command $green
set -g fish_color_param $fg
set -g fish_color_keyword $red
set -g fish_color_quote $green
set -g fish_color_redirection $purple
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_gray $black
set -g fish_color_selection --background=$sel
set -g fish_color_search_match --background=$sel
set -g fish_color_operator $blue
set -g fish_color_escape $purple
set -g fish_color_autosuggestion $black
set -g fish_color_cancel $red

# Prompt
set -g fish_color_cwd $yellow
set -g fish_color_user $cyan
set -g fish_color_host $blue

# Completion Pager
set -g fish_pager_color_progress $black
set -g fish_pager_color_prefix $purple
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $black
    ]],
		sch
	)

	return template
end

return M
