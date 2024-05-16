// lib/utils.ts
async function sh(cmd) {
  return Utils.execAsync(cmd).catch((err) => {
    console.error(typeof cmd === "string" ? cmd : cmd.join(" "), err);
    return "";
  });
}
function range(length, start = 1) {
  return Array.from({ length }, (_, i) => i + start);
}

// modules/bar/workspaces.ts
var hyprland = await Service.import("hyprland");
var dispatch = (arg) => {
  sh(`hyprctl dispatch workspace ${arg}`);
};
var createWorkspaces = (ws) => Widget.Box({
  class_name: "workspace-box",
  spacing: 16,
  children: range(ws || 6).map((i) => Widget.Button({
    className: "workspace-button",
    onClicked: () => dispatch(i),
    attribute: i,
    setup: (self) => self.hook(hyprland, () => {
      self.toggleClassName("active", hyprland.active.workspace.id === i);
      self.toggleClassName("occupied", (hyprland.getWorkspace(i)?.windows || 0) > 0);
    })
  })),
  setup: (box) => {
    if (ws === 0) {
      box.hook(hyprland.active.workspace, () => box.children.map((btn) => {
        btn.visible = hyprland.workspaces.some((ws2) => ws2.id === btn.attribute);
      }));
    }
  }
});
var Workspaces = Widget.Box({
  class_name: "workspaces",
  child: createWorkspaces()
});
var workspaces_default = Workspaces;

// modules/bar/clock.ts
var date = Variable("", {
  poll: [1000, 'date "+%H:%M"']
});
var Clock = Widget.Box({
  className: "clock",
  child: Widget.Label({
    hpack: "center",
    label: date.bind()
  })
});
var clock_default = Clock;

// modules/bar/index.ts
var Bar = (monitor) => Widget.Window({
  monitor,
  className: "bar",
  name: `bar${monitor}`,
  anchor: ["bottom", "left", "right"],
  exclusivity: "exclusive",
  child: Widget.CenterBox({
    className: "bar-box",
    start_widget: Widget.Box({
      hexpand: true,
      children: [workspaces_default]
    }),
    center_widget: Widget.Box({
      hexpand: true
    }),
    end_widget: Widget.Box({
      hexpand: true,
      children: [clock_default]
    })
  })
});
var bar_default = Bar;

// config.ts
App.config({
  style: "./styles.css",
  windows: [bar_default(0)]
});
