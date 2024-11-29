import config from "config.json";


const DockApp = (
  imagePath: string,
  command: string,
  margins: [number, number] = [-1, -1],
  css: string | undefined = undefined
) => Widget.EventBox({
  className: 'dockAppEventbox',
  heightRequest: 80,
  marginLeft: margins[0] === -1 ? 0 : margins[0],
  marginRight: margins[1] === -1 ? 0 : margins[1],
  css: css ?? "",
  onPrimaryClick: () => Utils.execAsync(command),
  child: Widget.Icon({
    icon: `${config.picturePath}/${imagePath}`,
    size: 61
  })
});


export default DockApp;
