const date = Variable("", {
  poll: [1000, 'date "+%H:%M"'],
});

const Clock = Widget.Box({
  className: "clock",
  child: Widget.Label({
    hpack: "center",
    label: date.bind(),
  }),
});

export default Clock;
