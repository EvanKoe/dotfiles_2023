
// Main class
class GlobalVariables {
  // Declare variables here
  _monitorNb = Variable<string>('1');
  _brightness = Variable<string>('50');
  _interface: string = Utils.exec("sh -c 'ls -w1 /sys/class/backlight' | head -1");


  // The constructor: initiate all values here
  constructor() {
    // MonitorNb setup
    this._monitorNb = Variable('1', {
      listen: 'bash -c "hyprctl monitors -j | jq \'. | length\'"'
    });
    this._monitorNb.value = Utils.exec('bash -c "hyprctl monitors -j | jq \'. | length\'" || echo 1');

    // Brightness setup
    const brightnessFile: string = `/sys/class/backlight/${this._interface}/brightness`;
    this._brightness = Variable('50', {
      poll: [500, `cat ${brightnessFile}`]
    });
  }


  // Methods: can create getters/setters
  getMonitorNumber(): number {
    try {
      return Number(this._monitorNb.value);
    } catch (err) {
      return 1;
    }
  }


  getBrightness(): number {
    try {
      return Number(this._brightness.value);
    } catch (err) {
      return 50;
    }
  }
}


// Singleton
const globals = new GlobalVariables();


export default globals;
