import WidgetSound from '../Widgets/Sound';
import WidgetBattery from '../Widgets/Battery';
import DispDateTime from '../Widgets/DateTime';
import WindowButton from '../Widgets/WindowButton';
import DesktopName from '../Widgets/DesktopName';

// Right side of the bar
const Right = () => Widget.Box({
  hpack: "end",
  children: [
    WidgetSound(),
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
      WindowButton('closeBtn', '#900'),
      WindowButton('maximizeBtn', '#090'),
      WindowButton('minimizeBtn', '#dd0'),
      DesktopName()
    ]
  })
}


// The bar in itself
const Bar = (monitor = 0) => Widget.Window({
  monitor,
  className: 'container',
  exclusivity: 'exclusive',
  name: `bar-${monitor}`,
  anchor: ['bottom', 'left', 'right'],
  child: Widget.CenterBox({
    className: 'mainBox',
    vertical: false,
    startWidget: Left(),
    centerWidget: Center(),
    endWidget: Right()
  })
});


export default Bar;
