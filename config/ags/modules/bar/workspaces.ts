import { sh, range } from "lib/utils";

const hyprland = await Service.import("hyprland");

const dispatch = (arg: string | number) => {
  sh(`hyprctl dispatch workspace ${arg}`);
};

const createWorkspaces = (ws?: number) =>
  Widget.Box({
    class_name: "workspace-box",
    spacing: 16,
    children: range(ws || 6).map((i) =>
      Widget.Button({
        className: "workspace-button",
        onClicked: () => dispatch(i),
        attribute: i,
        setup: (self) =>
          self.hook(hyprland, () => {
            self.toggleClassName("active", hyprland.active.workspace.id === i);
            self.toggleClassName(
              "occupied",
              (hyprland.getWorkspace(i)?.windows || 0) > 0,
            );
          }),
      }),
    ),
    setup: (box) => {
      if (ws === 0) {
        box.hook(hyprland.active.workspace, () =>
          box.children.map((btn) => {
            btn.visible = hyprland.workspaces.some(
              (ws) => ws.id === btn.attribute,
            );
          }),
        );
      }
    },
  });

const Workspaces = Widget.Box({
  class_name: "workspaces",
  child: createWorkspaces(),
});

export default Workspaces;
