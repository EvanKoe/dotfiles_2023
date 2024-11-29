import config from 'config.json';
import _brightness from '../Services/Brightness';
import globals from 'ts/globals';


// Widget
const BrightnessBar = () => Widget.Box({
  children: [
    Widget.Label({
      label: globals._brightness.bind().as((v: string) => `${v} %`),
      marginRight: 12,
      className: 'desktopText'
    }),
    Widget.Icon({
      icon: `${config.picturePath}/brightness_macos.png`,
      size: 24,
      marginRight: 24
    })
  ]
});


export default BrightnessBar;
