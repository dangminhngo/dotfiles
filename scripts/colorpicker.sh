case $1 in
--hex)
	output=$(hyprpicker)
	echo "$output" | xargs echo -n | wl-copy
	;;
--rgb)
	output=($(hyprpicker -f rgb))
	echo "rgb(${output[0]}, ${output[1]}, ${output[2]})" | xargs echo -n | wl-copy
	;;
--hsl)
	output=($(hyprpicker -f hsl))
	echo "hsl(${output[0]}, ${output[1]}, ${output[2]})" | xargs echo -n | wl-copy
	;;
esac
