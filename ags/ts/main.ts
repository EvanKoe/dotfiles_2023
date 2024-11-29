import globals from './globals';
import Dock from './Windows/Dock';
import Bar from './Windows/Bar';


App.addIcons(`${App.configDir}/assets`);


console.log(globals.getMonitorNumber());
const bar_array = Array<number>(globals.getMonitorNumber(), 0);

App.config({
  style: './style.scss',
  windows: [
    Bar(0),
    Dock(0)
  ]
  //bar_array.map((_, i: number) => Bar(i))
});
