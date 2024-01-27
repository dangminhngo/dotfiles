# Crux Alpha Green colorscheme for Fish
# ~/.config/fish/conf.d/theme.fish

# --> special
set -l fg cfc7c2
set -l sel 3a464c

# --> palette
set -l red e67e80
set -l green a7c080
set -l yellow dbbc7f
set -l orange e69875
set -l blue 6c86db
set -l magenta b495d3
set -l pink d699b6
set -l cyan 76b4cc
set -l gray 5f727c

# Syntax Highlighting
set -g fish_color_normal $fg
set -g fish_color_command $green
set -g fish_color_param $fg
set -g fish_color_keyword $red
set -g fish_color_quote $green
set -g fish_color_redirection $magenta
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_gray $gray
set -g fish_color_selection --background=$sel
set -g fish_color_search_match --background=$sel
set -g fish_color_operator $blue
set -g fish_color_escape $magenta
set -g fish_color_autosuggestion $gray
set -g fish_color_cancel $red

# Prompt
set -g fish_color_cwd $yellow
set -g fish_color_user $cyan
set -g fish_color_host $blue

# Completion Pager
set -g fish_pager_color_progress $gray
set -g fish_pager_color_prefix $magenta
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $gray
    