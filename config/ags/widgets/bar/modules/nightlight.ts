import ToggleButton from "../toggle-button"
import { sh } from "lib/utils"

const icon = Widget.Icon({ icon: "night-light-symbolic" })

export default function Nightlight() {
  return ToggleButton({
    name: "nightlight",
    child: icon,
    onClicked: () => sh("$HOME/.dotfiles/scripts/util.sh nightlight"),
    tooltipText: `Nightlight: Off`,
  })
}
