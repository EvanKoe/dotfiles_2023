import { GLib, Variable, bind } from "astal";

export default function BrightWidget() {
  const bright = Variable<number>(0).poll(
    1000, "brightnessctl g"
  );

  const formatPercent = (p: number): string => {
    const value = p * (100 / 255);
    return `${value.toFixed(0)} %`;
  }

  return (
    <box
      className="Battery"
      css="margin-right: 24px"
    >
      <icon icon="video-display" />
      <label
        label={bind(bright).as(formatPercent)}
        css="margin-left: 8px"
      />
      <></>
    </box>
  );
}
