#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
# COLORPICKER
# --------------------------------------------------------------------------------------------------
colorpicker() {
    theme="~/.config/rofi/colorpicker.rasi"

    killall -q rofi

    # Options
    hex_opt="HEX"
    rgb_opt="RGB"
    hsl_opt="HSL"

    # Variables passed to dmenu
    options="$hex_opt\n$rgb_opt\n$hsl_opt"
    opt=$(echo -e "$options" | rofi -dmenu -p "hyprpicker" -theme $theme)

    if [ -z $opt ]; then
        exit 0
    fi

    sleep 1
    case $opt in
        $hex_opt)
            output=$(hyprpicker)
            hex=${output,,}
            wl-copy $hex
            notify-send "$hex copied to your system clipboard"
            ;;
        $rgb_opt)
            output=$(hyprpicker -f rgb)
            values=($output)
            rgb="rgb(${values[0]}, ${values[1]}, ${values[2])}"
            wl-copy $rgb
            notify-send "$rgb copied to your system clipboard"
            ;;
        $hsl_opt)
            output=$(hyprpicker -f hsl)
            values=($output)
            hsl "hsl(${values[0]}, ${values[1]}, ${values[2])}"
            wl-copy $hsl
            notify-send "$hsl copied to your system clipboard"
            ;;
    esac
}

# --------------------------------------------------------------------------------------------------
# ZATHURA DOCUMENTS HISTORY
# --------------------------------------------------------------------------------------------------
docs() {
    theme="~/.config/rofi/documents.rasi"
    killall -q rofi
    path=$(xdg-user-dir DOCUMENTS)
    files=$(ls $path)

    opt=$(printf "%s\n" $files | rofi -dmenu -p "Zathura" -theme $theme)

    if [ -z $opt ]; then
      exit 0
    fi

    zathura "$path/$opt"
    exit 0
}

# --------------------------------------------------------------------------------------------------
# LAUNCHER
# --------------------------------------------------------------------------------------------------
launcher() {
    theme="~/.config/rofi/launcher.rasi"
    killall -q rofi
    opt=$(rofi -show drun -theme $theme)

    if [ -z $opt ]; then
        exit 0
    fi
}

# --------------------------------------------------------------------------------------------------
# Quit 
# --------------------------------------------------------------------------------------------------
quit() {
    theme="~/.config/rofi/powermenu.rasi"
    uptime=$(uptime -p | sed -e 's/up //g')

    killall -q rofi

    # options
    suspend=""
    lock=""
    logout=""
    reboot=""
    shutdown=""

    # variables passed to dmenu
    opts="$suspend\n$lock\n$logout\n$reboot\n$shutdown"

    opt=$(echo -e $opts | rofi -dmenu -p "Uptime: $uptime" -theme $theme -selected-row 2)

    if [ -z $opt ]; then
        exit 0
    fi

    case $opt in
        $shutdown)
          poweroff
          ;;
        $reboot)
          reboot
          ;;
        $logout)
          hyprctl dispatch exit 0
          ;;
        $lock)
          ~/.dotfiles/scripts/util.sh lock
          ;;
        $suspend)
          systemctl suspend
          ;;
    esac
}

# --------------------------------------------------------------------------------------------------
# Capture
# --------------------------------------------------------------------------------------------------
capture() {
    pid=$(pidof wf-recorder)

    # TODO: How can I stop wf-recorder normally without damaging video file.
    if [ -n "$pid" ]; then
        notify-send "A recording instance has already running"
    else
        theme="~/.config/rofi/recorder.rasi"
        path=$(xdg-user-dir VIDEOS)/captures
        mkdir -p $path

        killall -q rofi

        # Options
        sound=""
        silent=""
        crop=""

        # Variables passed to dmenu
        opts="$sound\n$silent\n$crop"

        opt=$(echo -e $opts | rofi -dmenu -p "Screen Capture" -theme $theme)

        if [ -z $opt ]; then
            exit 0
        fi

        case $opt in
            $sound)
                wf-recorder -a -f "$path/$(date +%Y%m%d_%H%M%S.mp4)" > /dev/null &
                notify-send "Capture with sound"
                ;;
            $silent)
                alacritty -e wf-recorder -f "$path/$(date +%Y%m%d_%H%M%S.mp4)" > /dev/null &
                notify-send "Capture without sound"
                ;;
            $crop)
                alacritty -e wf-recorder -g $(slurp) -f "$path/$(date +%Y%m%d_%H%M%S.mp4)" > /dev/null &
                notify-send "Capture with crop"
                ;;
        esac
    fi
}

# --------------------------------------------------------------------------------------------------
# SCREENSHOT
# --------------------------------------------------------------------------------------------------
screenshot() {
    theme="~/.config/rofi/screenshot.rasi"
    path="$(xdg-user-dir PICTURES)/screenshots"
    mkdir -p $path

    killall -q rofi

    # Options
    normal=""
    crop=""

    # Variables passed to dmenu
    opts="$normal\n$crop"

    opt=$(echo -e $opts | rofi -dmenu -p "grim" -theme $theme)

    if [ -z $opt ]; then
        exit 0
    fi

    case $opt in
      $normal)
        grim "$path/$(date +%Y%m%d_%H%M%S.png)"
        notify-send "Screenshot saved $path"
        ;;
      $crop)
        grim -g $(slurp) "$path/$(date +%Y%m%d_%H%M%S.png)"
        notify-send "Screenshot saved $path"
        ;;
    esac
}

# --------------------------------------------------------------------------------------------------
# CLIENTS
# --------------------------------------------------------------------------------------------------
clients() {
    theme="~/.config/rofi/clients.rasi"

    killall -q rofi

    opt=$(hyprctl clients -j | jq -r '.[] | "\(.pid) :: \(.title)"' | rofi -dmenu -p "Clients" -theme $theme)

    if [ -z "$opt"]; then
      exit 0
    fi

    IFS=" :: " read -a splitted <<< "$opt"

    pid=${splitted[0]}

    if [ -z "$pid"]; then
      exit 0
    fi

    hyprctl dispatch focuswindow pid:$pid
    exit 0
}

case $1 in
    colorpicker) colorpicker ;;
    docs) docs ;;
    launcher) launcher ;;
    capture) capture ;;
    screenshot) screenshot ;;
    clients) clients ;;
    quit) quit ;;
esac
