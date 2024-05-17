import type GObject from "gi://GObject?version=2.0"
import { type ButtonProps } from "types/widgets/button"

type ToggleButtonProps = ButtonProps & {
  name: string
  connection?: [GObject.Object | undefined, (() => boolean) | undefined]
}

export default function ToggleButton({
  name,
  setup,
  connection: [service, condition] = [undefined, undefined],
  ...props
}: ToggleButtonProps) {
  return Widget.Button({
    className: `toggle-button ${name}`,
    setup: (self) => {
      if (service && condition) {
        self.hook(service, () => {
          self.toggleClassName("active", condition())
        })
      }

      if (setup) setup(self)
    },
    ...props,
  })
}
