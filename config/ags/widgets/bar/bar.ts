import Workspaces from "./modules/workspaces"
import Clock from "./modules/clock"
import ActiveClient from "./modules/active-client"
import Volume from "./modules/volume"
import Nightlight from "./modules/nightlight"
import Systray from "./modules/systray"
import Network from "./modules/network"
import Bluetooth from "./modules/bluetooth"
import Notif from "./modules/notif"

export default function Bar(monitor: number) {
  return Widget.Window({
    monitor,
    className: "bar",
    name: `bar${monitor}`,
    anchor: ["bottom", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      className: "bar-box",
      start_widget: Widget.Box({
        hexpand: true,
        spacing: 16,
        children: [Workspaces(), ActiveClient()],
      }),
      center_widget: Widget.Box({
        hexpand: true,
        children: [],
      }),
      end_widget: Widget.Box({
        hpack: "end",
        hexpand: true,
        spacing: 16,
        children: [Systray(), Volume(), Network(), Bluetooth(), Notif(), Nightlight(), Clock()],
      }),
    }),
  })
}
