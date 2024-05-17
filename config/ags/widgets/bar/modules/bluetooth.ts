import icons from "lib/icons"
import ToggleButton from "../toggle-button"

const bluetooth = await Service.import("bluetooth")

const icon = Widget.Icon({
  icon: bluetooth.bind("enabled").as((on) => (on ? icons.bluetooth.enabled : icons.bluetooth.disabled)),
})

export default function Bluetooth() {
  return ToggleButton({
    name: "bluetooth",
    onClicked: () => (bluetooth.enabled = !bluetooth.enabled),
    connection: [bluetooth, () => bluetooth.enabled],
    child: icon,
    tooltipText: "Bluetooth: Off",
    setup: (self) => {
      self.hook(bluetooth, () => {
        self.tooltip_text = `Bluetooth: ${bluetooth.enabled ? "On" : "Off"}`
      })
    },
  })
}
