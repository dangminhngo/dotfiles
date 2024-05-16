import Workspaces from "./workspaces";
import Clock from "./clock";

const Bar = (monitor: number) =>
  Widget.Window({
    monitor,
    className: "bar",
    name: `bar${monitor}`,
    anchor: ["bottom", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      className: "bar-box",
      start_widget: Widget.Box({
        hexpand: true,
        children: [Workspaces],
      }),
      center_widget: Widget.Box({
        hexpand: true,
      }),
      end_widget: Widget.Box({
        hexpand: true,
        children: [Clock],
      }),
    }),
  });

export default Bar;
