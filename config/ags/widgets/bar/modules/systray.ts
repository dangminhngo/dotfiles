import ToggleButton from "../toggle-button"
const systemtray = await Service.import("systemtray")

export default function Systray() {
  const items = systemtray.bind("items").as((items) =>
    items.map((item) =>
      Widget.Button({
        child: Widget.Icon({ icon: item.bind("icon"), size: 14 }),
        on_primary_click: (_, event) => item.activate(event),
        on_secondary_click: (_, event) => item.openMenu(event),
        tooltip_markup: item.bind("tooltip_markup"),
      })
    )
  )

  const revealer = Widget.Revealer({
    className: "revealer",
    revealChild: false,
    transitionDuration: 500,
    transition: "slide_left",
    child: Widget.Box({ spacing: 8, children: items }),
  })

  const button = ToggleButton({
    name: "systray-button",
    child: Widget.Icon({ icon: "pan-start-symbolic" }),
    onClicked: () => (revealer.reveal_child = !revealer.reveal_child),
  })

  return Widget.Box({
    className: "systray",
    children: [revealer, button],
  })
}
