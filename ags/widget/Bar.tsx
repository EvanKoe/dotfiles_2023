import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import ApplicationTitle from "./Bar/ApplicationTitle";
import { Desktops } from "./Bar/Desktops";
import Hour from "./Bar/Hour";
import BatteryWidget from "./Bar/Battery";
import Shutdown from "./Bar/Shutdown";
import SoundWidget from "./Bar/Sound";


export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;


  return (
    <window
      className="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox homogeneous={true}>
        <box halign={Gtk.Align.START}>
          <Shutdown />
          <ApplicationTitle />
        </box>

        <Desktops hexpand />

        <box
          halign={Gtk.Align.END}
          className="RightContainer"
        >
          <BatteryWidget />
          <Hour />
        </box>
      </centerbox>
    </window>
  );
}
