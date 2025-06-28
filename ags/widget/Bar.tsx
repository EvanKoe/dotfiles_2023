import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import ApplicationTitle from "./Bar/ApplicationTitle";
import { Desktops } from "./Bar/Desktops";
import Hour from "./Bar/Hour";
import BatteryWidget from "./Bar/Battery";
import Shutdown from "./Bar/Shutdown";
import BrightWidget from "./Bar/Bright";
import SoundWidget from "./Bar/Sound";


export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;


  return (
    <window
      className="Container"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox
				className="Bar"
				homogeneous={true}
				margin={12}
				marginTop={8}
				marginBottom={8}
			>
        <box halign={Gtk.Align.START}>
          <Shutdown />
          <ApplicationTitle />
        </box>

        <Desktops hexpand />

        <box
          halign={Gtk.Align.END}
          className="RightContainer"
        >
          <SoundWidget />
          <BrightWidget />
          <BatteryWidget />
          <Hour />
        </box>
      </centerbox>
    </window>
  );
}
