import { SoundBar } from '../Widgets/Sound';
import WidgetBattery from '../Widgets/Battery';
import DispDateTime from '../Widgets/DateTime';
import WindowButton from '../Widgets/WindowButton';
import DesktopName from '../Widgets/DesktopName';
import Config from 'config.json';
import { Battery } from 'types/service/battery';
import BrightnessBar from 'ts/Widgets/BrightnessBar';


const isMaximized = Variable<boolean>(false);
const _battery: Battery = await Service.import('battery');


const toggleMax = () => {
  const script = `${Config.home}/.config/hypr/triggerFullscreen.sh`;
  isMaximized.setValue(!isMaximized.value);
  Utils.execAsync(script);
}


const getBgColor = () => {
  if (_battery.percent <= 10 && !!_battery.charging) {
    return 'rgba(208, 93, 16, 0.8)';
  } else if (_battery.percent <= 10) {
    return 'rgba(255, 0, 0, 0.8)';
  }
  // Pick app color
  return 'rgba(0, 0, 0, 0.4)';
}


// Right side of the bar
const Right = () => Widget.Box({
  hpack: "end",
  children: [
    BrightnessBar(),
    SoundBar(),
    WidgetBattery(),
    DispDateTime()
  ]
})


// Center of the bar
const Center = () => Widget.Box({
  children: []
})


// Left side of the bar
const Left = () => {
  return Widget.Box({
    children: [
      WindowButton('window-close', '#900', () => Utils.execAsync('hyprctl dispatch killactive')),
      WindowButton('view-restore', '#090', toggleMax),
      WindowButton('mail-forward', '#dd0', () => Utils.execAsync("hyprctl dispatch togglefloating")),
      DesktopName()
    ]
  })
}


// The bar in itself
const Bar = (monitor: number = 0) => Widget.Window({
  monitor,
  exclusivity: 'exclusive',
  layer: 'top',
  name: `bar-${monitor}`,
  heightRequest: 30,
  css: `background-color: ${getBgColor()}`,
  anchor: ['top', 'left', 'right'],
  child: Widget.CenterBox({
    className: 'mainBox',
    vertical: false,
    startWidget: Left(),
    centerWidget: Center(),
    endWidget: Right()
  })
});


export default Bar;
