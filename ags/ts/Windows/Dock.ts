import DockApp from "ts/Widgets/DockApp";
import config from 'config.json';
import Gtk from "types/@girs/gtk-3.0/gtk-3.0";

type DockAppType = {
  name: string;
  image: string;
  command: string;
};


const getDockApps = (): Gtk.Widget[] => {
  let new_array: Gtk.Widget[] = [];;

  config.dock_app.forEach((app: DockAppType) => {
    let new_app: Gtk.Widget = DockApp(
      app.image,
      app.command,
      [8, 8]
    );
    new_array.push(new_app);
  });

  return new_array;
}


const Dock = (monitor: number = 0) => Widget.Window({
  monitor,
  className: 'dockContainer',
  exclusivity: 'exclusive',
  layer: 'top',
  name: `dock-${monitor}`,
  heightRequest: 80,
  hexpand: false,
  anchor: ['bottom'],
  child: Widget.Box({
    children: getDockApps()
  })
});


export default Dock;
