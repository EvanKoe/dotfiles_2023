import { Hyprland } from "types/service/hyprland";


// Service
const _hypr: Hyprland = await Service.import('hyprland');

// Widget
const DesktopName = () => Widget.Label({
  setup: (self) => self.hook(_hypr, self => {
    self.label = "Desktop " + _hypr.active.workspace.id.toString();
  }),
  marginLeft: 12,
  className: "desktopText"
});


export default DesktopName;
