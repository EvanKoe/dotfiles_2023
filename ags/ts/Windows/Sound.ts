import { isSoundShown, SoundWindow } from "ts/Widgets/Sound";


//TODO Find a way to hide it
const Volume = (monitor = 0) => Widget.Window({
  monitor,
  name: `volumeWindow-${monitor}`,
  visible: !!isSoundShown.bind(),
  className: 'volumeWindow',
  widthRequest: 150,
  heightRequest: 150,
  child: SoundWindow()
});


export default Volume;
