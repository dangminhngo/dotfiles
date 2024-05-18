#!/usr/bin/env bash

check_dep() {
	if which $1 >/dev/null; then
		exit 0
	else
		exit 1
	fi
}
