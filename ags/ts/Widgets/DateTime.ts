// Date
const DispDate = (format: string = "%A %d %b") => Widget.Label({
  className: 'desktopText'
}).poll(
  1000,
  (label) => label.label = Utils.exec(`date +'${format}'`)
);


// Time
const DispTime = (format: string = "%H:%M") => Widget.Box({
  children: [
    Widget.Label({
      className: 'desktopText',
      marginRight: 12,
      marginLeft: 12
    }).poll(
      1000,
      (label) => label.label = Utils.exec(`date +'${format}'`)
    )
  ]
});


// Both
const DispDateTime = (
  dateFormat: string = "%A %d %b",
  timeFormat: string = "%H:%M"
) => Widget.Box({
  children: [
    DispDate(dateFormat),
    DispTime(timeFormat)
  ]
});


export { DispDate, DispTime };
export default DispDateTime;
