import { doNotGoFurther } from "ts/functions";
import { Audio } from "types/service/audio";


// Service
const _sound: Audio = await Service.import('audio');


// Variable
const isSoundShown = Variable<boolean>(false);


// Sound widget
const WidgetSound = () => Widget.Box({
  children: [
    Widget.Revealer({
      revealChild: !!isSoundShown.value,
      transition: 'crossfade',
      child: Widget.ProgressBar({
        vpack: 'center',
        vertical: false,
        widthRequest: 100,
        marginRight: 8,
        value: _sound['speaker'].bind('volume').as((v: number) => doNotGoFurther(v, 1))
      }),
    }),
    Widget.Label({
      marginRight: 24,
      className: 'desktopText',
      label: _sound['speaker']
      .bind('volume')
      .as((v: number) => doNotGoFurther(Math.round(v * 100)).toString() + ' %')
    })
  ]
});


export default WidgetSound;
