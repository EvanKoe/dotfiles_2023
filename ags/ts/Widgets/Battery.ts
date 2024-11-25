import { doNotGoFurther } from "ts/functions";
import { Battery } from "types/service/battery";
import config from "ts/config";


// Service
const _battery: Battery = await Service.import('battery');


const getBatteryIcon = (): string => {
  if (!!_battery.charging) {
    return `${config.home}/Pictures/icons/battery_macos_charging.png`;
  }
  return `${config.home}/Pictures/icons/battery_macos.png`;
}


// Battery
const WidgetBattery = () => Widget.Box({
  children: [
    Widget.Label({
      label: _battery.bind('percent').as(p => doNotGoFurther(p, 100).toString() + " %"),
      className: 'desktopText',
      marginRight: 8
    }),
    Widget.Icon({
      icon: getBatteryIcon(),
      size: 36,
      marginRight: 24
    })
  ]
});


export default WidgetBattery;
