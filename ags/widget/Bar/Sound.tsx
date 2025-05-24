import { bind } from "astal";
import Wp from "gi://AstalWp"

export default function SoundWidget() {
  const speaker = Wp.get_default()?.audio?.default_speaker;

  const formatSound = (v: number): string => {
    if (v <= 0 || speaker?.mute) {
      return "Muted";
    }

    return `${Math.floor(v * 100)} %`;
  }

  return !!speaker && (
    <box
      className="Battery"
      css="margin-right: 24px"
    >
      <icon icon={bind(speaker, "volumeIcon")} />
      <label
        label={bind(speaker, "volume").as(formatSound)}
        css="margin-left: 8px"
      />
    </box>
  );
}
