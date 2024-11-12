import Bar from './Windows/Bar';
import Volume from './Windows/Sound.ts';

App.addIcons(`${App.configDir}/assets`);

App.config({
  style: './style.scss',
  windows: [
    Bar(1),
  ]
});

//TODO Find a way to call Bar(1) if monitor 1 exists
//TODO Find a way to blur the bar
