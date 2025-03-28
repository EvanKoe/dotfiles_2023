import { bind } from "astal";
import Wp from "gi://AstalWp"

export default function SoundWidget() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;

  return (
    <box
      className="Battery"
      marginRight={12}
    >
      <icon
        icon={bind(speaker, "volumeIcon")}
        marginRight={8}
      />

      <label
        label={bind(speaker, "volume").as(v => v === 0 ? "Muted" : `${Math.floor(v * 100)}%`)}
      />
    </box>
  )
}
