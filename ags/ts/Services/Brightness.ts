class BrightnessService extends Service {
  static {
    Service.register(
      this,
      {
        'screen-changed': ['float'],
      },
      {
        'percent': ['float', 'r']
      }
    );
  }


  #interface: string = Utils.exec("sh -c 'ls -w1 /sys/class/backlight' | head -1");
  #percent: number = 0;
  #max: number = Number(Utils.exec('brightnessctl max'));


  get percent() {
    if (this.#percent < 0) {
      return 0;
    } else if (this.#percent > 100) {
      return 100;
    }

    return this.percent
  }


  constructor() {
    super();

    const brightness = `/sys/class/backlight/${this.#interface}/brightness`;
    Utils.monitorFile(brightness, this.#onChange);

    this.#onChange();
  }


  #onChange() {
    const bnOn255: number = Utils.exec('brightnessctl get');
    this.#percent = Math.round(bnOn255 / this.#max * 100);

    this.emit('changed');
    this.notify('percent');
    this.emit('screen-changed', this.#percent);
  }


  connect(event: string = 'changed', callback: any) {
    return super.connect(event, callback);
  }
}


const service = new BrightnessService;


export default service;
