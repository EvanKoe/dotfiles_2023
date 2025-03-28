import { GLib, Variable } from "astal"

export default function() {
  const format: string = "%H:%M";

  const date = Variable<string>("").poll(1000, () =>
    GLib.DateTime.new_now_local().format(format)!
  );

  return (
    <box className="Hour">
      <label>
        { date() }
      </label>
    </box>
  )
}
