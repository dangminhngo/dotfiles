# Proxima colorscheme for Fish
# ~/.config/fish/conf.d/theme.fish

# --> special
set -l fg bbc8cb
set -l sel 3A484B

# --> palette
set -l red e3787c
set -l green a4c76f
set -l yellow ddd764
set -l orange e39754
set -l blue 6e99de
set -l magenta b08be4
set -l pink d676c3
set -l cyan 66c5cc
set -l gray 596E73

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
    