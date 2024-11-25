import globals from './globals';
import Bar from './Windows/Bar';


App.addIcons(`${App.configDir}/assets`);


App.config({
  style: './style.scss',
  windows: globals.getMonitorNumber() === 2 ? [
    Bar(1),
    Bar(0)
  ] : [
    Bar(0)
  ]
});
