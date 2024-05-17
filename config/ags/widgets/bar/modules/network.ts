import ToggleButton from "../toggle-button"
import { sh } from "lib/utils"

const network = await Service.import("network")

export default function Network() {
  return ToggleButton({
    name: "network",
    onClicked: () => sh(`alacritty --title nmtui --class nmtui -e nmtui`),
    child: Widget.Icon({
      icon: network.wired.bind("icon_name") ?? network.wired.bind("icon_name"),
    }),
    connection: [network, () => network.wifi.enabled || network.wired.internet === "connected"],
    tooltipText:
      network.wired.bind("internet").as((i) => `Wired: ${i}`) ??
      network.wifi.bind("ssid").as((ssid) => `Wifi: ${ssid}`),
  })
}
