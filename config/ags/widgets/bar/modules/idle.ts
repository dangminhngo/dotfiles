import ToggleButton from "../toggle-button"
import { sh } from "lib/utils"
import icons from "lib/icons"

const enabled = Variable(false, {
  listen: ["pgrep hypridle", (out) => !!!out],
})

const icon = Widget.Icon({
  icon: enabled.bind().as((value) => (value ? icons.idle.enabled : icons.idle.disabled)),
})

function toggle() {
  if (enabled.value) {
    enabled.setValue(false)
    sh(`pkill hypridle`)
    Utils.notify({
      iconName: icons.idle.disabled,
      summary: "Idle",
      body: "Off",
    })
  } else {
    enabled.setValue(true)
    sh(`hypridle &`)
    Utils.notify({
      iconName: icons.idle.enabled,
      summary: "Idle",
      body: "On",
    })
  }
}

export default function Idle() {
  return ToggleButton({
    name: "idle",
    child: icon,
    onClicked: toggle,
    connection: [enabled, () => enabled.value],
  })
}
