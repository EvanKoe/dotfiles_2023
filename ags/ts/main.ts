import Bar from './Windows/Bar';

App.config({
  style: './style.scss',
  windows: [
    Bar(0),
  ]
});

//TODO Find a way to call Bar(1) if monitor 1 exists
//TODO Find a way to blur the bar
