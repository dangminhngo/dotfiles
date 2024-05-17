import ToggleButton from "../toggle-button"

const time = Variable("", {
  poll: [1000, 'date "+%H:%M"'],
})

const date = Variable("", {
  poll: [1000, 'date "+%a - %B %d, %Y"'],
})

export default function Clock() {
  return ToggleButton({
    name: "clock",
    label: time.bind(),
    onClicked: () => App.toggleWindow("calendar"),
    tooltipText: date.bind(),
  })
}
