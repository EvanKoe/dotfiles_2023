import Hyprland from "gi://AstalHyprland";
import { bind } from 'astal';
import config from "../../config";
import { Gtk } from "astal/gtk3";


export default function ApplicationTitle() {
  const hypr = Hyprland.get_default();

  const getTitle = (fc: Hyprland.Client) => {
    if (!fc) {
      return "Desktop";
    }

    let title: string = "";

    if (config.applicationTitleOrClass === 'title') {
      title = fc.get_title();
    } else {
      title = fc.get_class();
    }

    const capital: string = title[0].toUpperCase();
    const rest: string = title.substring(1, title.length)
      .replaceAll("-", " ")
      .replaceAll("_", " ");

    return capital + rest;
  }

  return (
    <box className="ApplicationTitle">
      <label css="margin-left: 12px">
        { bind(hypr, "focusedClient").as(getTitle) }
      </label>
    </box>
  );
}
