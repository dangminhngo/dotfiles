# Proxima colorscheme for Fish
# ~/.config/fish/conf.d/theme.fish

# --> special
set -l fg d4cbb8
set -l sel 3B4A4E

# --> palette
set -l red e67e80
set -l green a4c76f
set -l yellow d1cc66
set -l orange d69760
set -l blue 678dc9
set -l magenta a183cc
set -l pink c975b9
set -l cyan 76bfc4
set -l gray 586D74

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
    