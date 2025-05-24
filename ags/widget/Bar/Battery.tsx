import { bind } from "astal";
import Battery from "gi://AstalBattery";

export default function BatteryWidget() {
  const bat = Battery.get_default()

  return (
    <box
      className="Battery"
      visible={bind(bat, "isPresent")}
      css="margin-right: 24px"
    >
      <icon
        icon={bind(bat, "batteryIconName")}
        css="margin-right: 8px"
      />
      <label label={bind(bat, "percentage").as(p =>
        `${Math.floor(p * 100)} %`
      )} />
    </box>
  );
}
