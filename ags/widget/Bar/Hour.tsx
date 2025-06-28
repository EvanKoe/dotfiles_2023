import { GLib, Variable } from "astal"

export default function() {
  const format: string = "%d %B";

  const date = Variable<string>("").poll(1000, () =>
    GLib.DateTime.new_now_local().format(format)!
  );

  const hour = Variable<string>('').poll(1000, () =>
    GLib.DateTime.new_now_local().format("%H:%M")!
  );

  return (
    <box>
      <box className="Date">
        <label>
          { date() }
        </label>
      </box>
      <box className="Hour">
        <label>
          { hour() }
        </label>
      </box>
    </box>
  )
}
