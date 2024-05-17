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

// widgets/bar/modules/workspaces.ts
var dispatch = function(arg) {
  hyprland.messageAsync(`dispatch workspace ${arg}`);
};
var hyprland = await Service.import("hyprland");
function Workspaces() {
  return Widget.Box({
    class_name: "workspaces",
    child: Widget.Box({
      class_name: "workspace-box",
      spacing: 16,
      children: range(6).map((i) => Widget.Button({
        className: "workspace-button",
        onClicked: () => dispatch(i),
        attribute: i,
        setup: (self) => self.hook(hyprland, () => {
          self.toggleClassName("active", hyprland.active.workspace.id === i);
          self.toggleClassName("occupied", (hyprland.getWorkspace(i)?.windows || 0) > 0);
        })
      }))
    })
  });
}

// widgets/bar/toggle-button.ts
function ToggleButton({
  name,
  setup,
  connection: [service, condition] = [undefined, undefined],
  ...props
}) {
  return Widget.Button({
    className: `toggle-button ${name}`,
    setup: (self) => {
      if (service && condition) {
        self.hook(service, () => {
          self.toggleClassName("active", condition());
        });
      }
      if (setup)
        setup(self);
    },
    ...props
  });
}

// widgets/bar/modules/clock.ts
var time = Variable("", {
  poll: [1000, 'date "+%H:%M"']
});
var date = Variable("", {
  poll: [1000, 'date "+%a - %B %d, %Y"']
});
function Clock() {
  return ToggleButton({
    name: "clock",
    label: time.bind(),
    onClicked: () => App.toggleWindow("calendar"),
    tooltipText: date.bind()
  });
}

// widgets/bar/modules/active-client.ts
var hyprland2 = await Service.import("hyprland");
function ActiveClient() {
  return Widget.Label({
    className: "active-client",
    label: hyprland2.active.client.bind("title"),
    maxWidthChars: 80,
    truncate: "end"
  });
}

// lib/icons.ts
var icons_default = {
  missing: "image-missing-symbolic",
  audio: {
    volume: {
      muted: "audio-volume-muted-symbolic",
      low: "audio-volume-low-symbolic",
      medium: "audio-volume-medium-symbolic",
      high: "audio-volume-high-symbolic",
      overamplified: "audio-volume-overamplified-symbolic"
    }
  },
  bluetooth: {
    enabled: "bluetooth-active-symbolic",
    disabled: "bluetooth-disabled-symbolic"
  },
  notif: {
    noisy: "notification-new-symbolic",
    silent: "notification-disabled-new-symbolic",
    message: "chat-bubbles-symbolic"
  },
  trash: {
    full: "user-trash-full-symbolic",
    empty: "user-trash-symbolic"
  },
  nightlight: {
    enabled: "night-light-symbolic",
    disabled: "night-light-disabled-symbolic"
  }
};

// widgets/bar/modules/volume.ts
var audio = await Service.import("audio");
function Volume() {
  const iconsByVolume = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted"
  };
  function getIcon() {
    const icon2 = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find((threshold) => threshold <= audio.speaker.volume * 100);
    return icon2 ? icons_default.audio.volume[iconsByVolume[icon2]] : icons_default.audio.volume.muted;
  }
  const icon = ToggleButton({
    name: "volume",
    child: Widget.Icon({ icon: Utils.watch(getIcon(), audio.speaker, getIcon), size: 16 }),
    onClicked: () => sh("pavucontrol"),
    onSecondaryClickRelease: () => audio.speaker.is_muted = !audio.speaker.is_muted,
    connection: [audio.speaker, () => !!!audio.speaker.is_muted],
    tooltipText: `Volume: ${Math.floor(audio.speaker.volume * 100)}%`,
    setup: (self) => {
      self.hook(audio.speaker, () => {
        self.tooltip_text = `Volume: ${Math.floor(audio.speaker.volume * 100)}%`;
      });
    }
  });
  const slider = Widget.Slider({
    hexpand: true,
    drawValue: false,
    on_change: ({ value }) => audio.speaker.volume = value,
    setup: (self) => self.hook(audio.speaker, () => {
      self.value = audio.speaker.volume || 0;
    })
  });
  return Widget.Box({
    className: "volume",
    css: "min-width: 128px",
    spacing: 8,
    children: [icon, slider]
  });
}

// widgets/bar/modules/nightlight.ts
var icon = Widget.Icon({ icon: "night-light-symbolic" });
function Nightlight() {
  return ToggleButton({
    name: "nightlight",
    child: icon,
    onClicked: () => sh("$HOME/.dotfiles/scripts/util.sh nightlight"),
    tooltipText: `Nightlight: Off`
  });
}

// widgets/bar/modules/systray.ts
var systemtray = await Service.import("systemtray");
function Systray() {
  const items = systemtray.bind("items").as((items2) => items2.map((item) => Widget.Button({
    child: Widget.Icon({ icon: item.bind("icon"), size: 16 }),
    on_primary_click: (_, event) => item.activate(event),
    on_secondary_click: (_, event) => item.openMenu(event),
    tooltip_markup: item.bind("tooltip_markup")
  })));
  return Widget.Box({
    children: items
  });
}

// widgets/bar/modules/network.ts
var network = await Service.import("network");
function Network() {
  return ToggleButton({
    name: "network",
    onClicked: () => sh(`alacritty --title nmtui --class nmtui -e nmtui`),
    child: Widget.Icon({
      icon: network.wired.bind("icon_name") ?? network.wired.bind("icon_name")
    }),
    connection: [network, () => network.wifi.enabled || network.wired.internet === "connected"],
    tooltipText: network.wired.bind("internet").as((i) => `Wired: ${i}`) ?? network.wifi.bind("ssid").as((ssid) => `Wifi: ${ssid}`)
  });
}

// widgets/bar/modules/bluetooth.ts
var bluetooth = await Service.import("bluetooth");
var icon2 = Widget.Icon({
  icon: bluetooth.bind("enabled").as((on) => on ? icons_default.bluetooth.enabled : icons_default.bluetooth.disabled)
});
function Bluetooth() {
  return ToggleButton({
    name: "bluetooth",
    onClicked: () => bluetooth.enabled = !bluetooth.enabled,
    connection: [bluetooth, () => bluetooth.enabled],
    child: icon2,
    tooltipText: "Bluetooth: Off",
    setup: (self) => {
      self.hook(bluetooth, () => {
        self.tooltip_text = `Bluetooth: ${bluetooth.enabled ? "On" : "Off"}`;
      });
    }
  });
}

// widgets/bar/modules/notif.ts
var n = await Service.import("notifications");
var icon3 = Widget.Icon({
  icon: n.bind("dnd").as((dnd) => icons_default.notif[dnd ? "silent" : "noisy"]),
  size: 16
});
function Notif() {
  return ToggleButton({
    name: "notif",
    child: icon3,
    onClicked: () => n.dnd = !n.dnd,
    connection: [n, () => n.dnd],
    tooltipText: `DND: Off`,
    setup: (self) => {
      self.hook(n, () => {
        if (n.dnd) {
          self.tooltip_text = "DND: On";
        } else {
          self.tooltip_text = n.notifications.length > 0 ? `You have ${n.notifications.length} notifications` : "DND: Off";
        }
      });
    }
  });
}

// widgets/bar/bar.ts
function Bar(monitor) {
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
        children: [Workspaces(), ActiveClient()]
      }),
      center_widget: Widget.Box({
        hexpand: true,
        children: []
      }),
      end_widget: Widget.Box({
        hpack: "end",
        hexpand: true,
        spacing: 16,
        children: [Systray(), Volume(), Network(), Bluetooth(), Notif(), Nightlight(), Clock()]
      })
    })
  });
}

// config.ts
App.config({
  style: "./styles.css",
  windows: [Bar(0)]
});
