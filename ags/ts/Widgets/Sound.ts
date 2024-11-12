import config from "ts/config";
import { doNotGoFurther, onOneToPercent } from "ts/functions";
import { Audio } from "types/service/audio";


// Service
const _sound: Audio = await Service.import('audio');


// Variable
const isSoundShown = Variable<boolean>(false);


const getSoundIcon = (): string => {
  if (_sound.speaker.is_muted) {
    return `${config.home}/Pictures/icons/mute.png`;
  }
  return `${config.home}/Pictures/icons/sound.png`;
}


const getSoundText = (): string => {
  if (_sound.speaker.is_muted) {
    return 'Muted';
  }
  return onOneToPercent(_sound.speaker.volume);
}


// Sound widget
const SoundBar = () => Widget.EventBox({
  onPrimaryClick: () => {
    isSoundShown.setValue(true);
    setTimeout(() => isSoundShown.setValue(false), 2000);
  },
  child: Widget.Box({
    children: [
      Widget.Label({
        setup: self => self.hook(_sound, self => {
          self.label = getSoundText();
        }),
        marginRight: 8,
        className: 'desktopText'
      }),
      Widget.Icon({
        icon: getSoundIcon(),
        size: 24,
        marginRight: 24
      })
    ]
  })
});


const SoundWindow = () => Widget.Revealer({
  revealChild: isSoundShown.bind(),
  transition: 'crossfade',
  child: Widget.Box({
    vertical: true,
    hpack: 'fill',
    vpack: 'fill',
    children: [
      Widget.Icon({
        setup: self => self.hook(_sound.speaker, () => {
          const icon = !!_sound.speaker.is_muted ? 'muted' : 'high';
          self.icon = "audio-volume-" + icon + "-symbolic";
        }),
        className: "volumeIcon",
        size: 96,
        widthRequest: 100,
        heightRequest: 100
      }),
      Widget.ProgressBar({
        setup: self => self.hook(_sound.speaker, () => {
          if (!!_sound.speaker.is_muted) {
            return self.value = 0;
          }
          self.value = doNotGoFurther(_sound.speaker.volume, 1);
        }),
        vpack: 'center',
        vertical: false,
        marginRight: 8,
        marginLeft: 8,
        marginTop: 12
      }),
      Widget.Label({
        setup: self => self.hook(_sound.speaker, () => {
          if (!!_sound.speaker.is_muted) {
            return self.label = 'Muted';
          }
          self.label = onOneToPercent(_sound.speaker.volume);
        }),
        marginTop: 4
      })
    ]
  })
});


export {
  SoundBar,
  SoundWindow,
  isSoundShown
}
