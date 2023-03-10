# Darkoma colorscheme for Fish
# ~/.config/fish/conf.d/theme.fish

# --> special
set -l fg ccdcdd
set -l sel 416062

# --> palette
set -l red f36a6f
set -l green 8fd780
set -l yellow e6dd90
set -l orange efaa6f
set -l blue 62b1ff
set -l magenta e67aca
set -l purple b28ff5
set -l cyan 5ddae2
set -l gray 588386

# Syntax Highlighting
set -g fish_color_normal $fg
set -g fish_color_command $green
set -g fish_color_param $fg
set -g fish_color_keyword $red
set -g fish_color_quote $green
set -g fish_color_redirection $purple
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
set -g fish_pager_color_prefix $purple
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $gray
    