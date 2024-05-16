#!/usr/bin/env bash

reload_ags() {
	killall ags
	ags -q
	ags --clear-cache
	ags --init
	ags &
}

lock() {
	killall hyprlock
	hyprlock
}

case $1 in
reload_ags)
	reload_ags
	;;
lock)
	lock
	;;
esac
