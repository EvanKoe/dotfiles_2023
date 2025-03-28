import { exec } from "astal";

export default function Shutdown() {
  const shutdown = () => {
    return exec("shutdown -h 0");
  }

  return (
    <eventbox onClick={shutdown}>
      <label
        className="Shutdown"
        marginLeft={12}
      >
        ⏻
      </label>
    </eventbox>
  );
}
