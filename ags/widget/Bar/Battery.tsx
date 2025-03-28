import { bind } from "astal";
import Battery from "gi://AstalBattery";

export default function BatteryWidget() {
  const bat = Battery.get_default()

  return (
    <box
      className="Battery"
      visible={bind(bat, "isPresent")}
      marginRight={12}
    >
      <icon
        icon={bind(bat, "batteryIconName")}
        marginRight={8}
      />
      <label label={bind(bat, "percentage").as(p =>
        `${Math.floor(p * 100)} %`
      )} />
    </box>
  );
}
