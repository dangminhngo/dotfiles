#!/usr/bin/env bash

colorpicker() {
	theme="~/.config/rofi/colorpicker.rasi"

	killall -q rofi

	# Options
	hex="HEX"
	rgb="RGB"
	hsl="HSL"

	# Variables passed to dmenu
	opts="$hex\n$rgb\n$hsl"
	opt=$(echo -e "$opts" | rofi -dmenu -p "hyprpicker" -theme $theme)

	if [ -z $opt ]; then
		exit 0
	fi

	sleep 1
	case $opt in
	$hex)
		clr=$(~/.dotfiles/scripts/colorpicker.sh --hex)
		notify-send "Colorpicker" "Color $clr copied to your clipboard"
		;;
	$rgb)
		clr=$(~/.dotfiles/scripts/colorpicker.sh --rgb)
		notify-send "Colorpicker" "Color $clr copied to your clipboard"
		;;
	$hsl)
		clr=$(~/.dotfiles/scripts/colorpicker.sh --hsl)
		notify-send "Colorpicker" "Color $clr copied to your system clipboard"
		;;
	esac
}

docs() {
	theme="~/.config/rofi/documents.rasi"
	killall -q rofi

	opt=$(printf "%s\n" $(ls ~/Documents) | rofi -dmenu -p "zathura" -theme $theme)

	if [ -z $opt ]; then
		exit 0
	fi

	zathura "~/Documents/$opt"
	exit 0
}

launcher() {
	theme="~/.config/rofi/launcher.rasi"
	killall -q rofi
	opt=$(rofi -show drun -theme $theme)

	if [ -z $opt ]; then
		exit 0
	fi
}

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

record() {
	pid=$(pidof wf-recorder)

	# TODO: How can I stop wf-recorder normally without damaging video file.
	if [ -n "$pid" ]; then
		notify-send "A recording instance has already running"
	else
		theme="~/.config/rofi/record.rasi"
		path=$(xdg-user-dir VIDEOS)/captures
		mkdir -p $path

		killall -q rofi

		# Options
		sound=""
		fullscreen_sound=""
		fullscreen=""
		selection=""

		# Variables passed to dmenu
		opts="$sound\n$fullscreen_sound\n$fullscreen\n$selection"

		opt=$(echo -e $opts | rofi -dmenu -p "wf-recorder" -theme $theme)

		if [ -z $opt ]; then
			exit 0
		fi

		case $opt in
		$sound)
			~/.dotfiles/scripts/record.sh --sound
			;;
		$fullscreen_sound)
			~/.dotfiles/scripts/record.sh --fullscreen-sound
			;;
		$fullscreen)
			~/.dotfiles/scripts/record.sh --fullscreen
			;;
		$selection)
			~/.dotfiles/scripts/record.sh
			;;
		esac
	fi
}

screenshot() {
	theme="~/.config/rofi/screenshot.rasi"
	path="$(xdg-user-dir PICTURES)/screenshots"
	mkdir -p $path

	killall -q rofi

	# Options
	fullscreen=""
	selection=""

	# Variables passed to dmenu
	opts="$fullscreen\n$selection"

	opt=$(echo -e $opts | rofi -dmenu -p "grim & swappy" -theme $theme)

	if [ -z $opt ]; then
		exit 0
	fi

	case $opt in
	$fullscreen)
		sleep 0.5
		~/.dotfiles/scripts/screenshot.sh --fullscreen
		;;
	$selection)
		sleep 0.5
		~/.dotfiles/scripts/screenshot.sh --selection
		;;
	esac
}

clients() {
	theme="~/.config/rofi/clients.rasi"

	killall -q rofi

	opt=$(hyprctl clients -j | jq -r '.[] | "\(.pid) :: \(.title)"' | rofi -dmenu -p "Clients" -theme $theme)

	if [ -z "$opt"]; then
		exit 0
	fi

	IFS=" :: " read -a splitted <<<"$opt"

	pid=${splitted[0]}

	if [ -z "$pid"]; then
		exit 0
	fi

	hyprctl dispatch focuswindow pid:$pid
	exit 0
}

clipboard() {
	theme="~/.config/rofi/clipboard.rasi"
	cliphist list | rofi -dmenu -p "cliphist" -theme $theme | cliphist decode | wl-copy
}

case $1 in
colorpicker) colorpicker ;;
docs) docs ;;
launcher) launcher ;;
record) record ;;
screenshot) screenshot ;;
clients) clients ;;
clipboard) clipboard ;;
quit) quit ;;
esac