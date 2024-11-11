import { doNotGoFurther } from "ts/functions";
import { Battery } from "types/service/battery";


// Service
const _battery: Battery = await Service.import('battery');


// Battery
const WidgetBattery = () => Widget.Label({
  label: _battery.bind('percent').as(p => doNotGoFurther(p, 100).toString() + " %"),
  className: 'desktopText',
  marginRight: 24
})


export default WidgetBattery;
