# Crux Midnight colorscheme for Fish
# ~/.config/fish/conf.d/theme.fish

# --> special
set -l fg b3bde4
set -l sel 33343d

# --> palette
set -l red e66c6e
set -l green b3d57d
set -l yellow d9c574
set -l orange e69875
set -l blue 6d80ed
set -l purple 9e6cd0
set -l magenta cd84a7
set -l cyan 7adbce
set -l black 55565e

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
    