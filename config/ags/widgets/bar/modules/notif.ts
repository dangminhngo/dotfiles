import icons from "lib/icons"
import ToggleButton from "../toggle-button"

const n = await Service.import("notifications")

const icon = Widget.Icon({
  icon: n.bind("dnd").as((dnd) => icons.notif[dnd ? "silent" : "noisy"]),
  size: 16,
})

export default function Notif() {
  return ToggleButton({
    name: "notif",
    child: icon,
    onClicked: () => (n.dnd = !n.dnd),
    connection: [n, () => n.dnd],
    tooltipText: `DND: Off`,
    setup: (self) => {
      self.hook(n, () => {
        if (n.dnd) {
          self.tooltip_text = "DND: On"
        } else {
          self.tooltip_text =
            n.notifications.length > 0 ? `You have ${n.notifications.length} notifications` : "DND: Off"
        }
      })
    },
  })
}
