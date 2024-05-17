const hyprland = await Service.import("hyprland")

export default function ActiveClient() {
  return Widget.Label({
    className: "active-client",
    label: hyprland.active.client.bind("title"),
    maxWidthChars: 80,
    truncate: "end",
  })
}
