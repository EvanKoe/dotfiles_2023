const WindowButton = (
  name: string,
  color: string = "#900",
  onPress: (() => void) = () => console.log("Button pressed")
) => {
  const isHovered = Variable<boolean>(false);

  return Widget.EventBox({
    name: name,
    onPrimaryClick: onPress,
    onHover: () => { isHovered.setValue(true) },
    onHoverLost: () => { isHovered.setValue(false) },
    marginRight: 4,
    widthRequest: 22,
    child: Widget.Box({
      className: 'windowButton',
      css: `background-color: ${color}`,
      children: [
        Widget.Revealer({
          revealChild: isHovered.bind(),
          transition: 'crossfade',
          child: Widget.Icon({
            icon: name,
            size: 16,
            marginRight: 3,
            marginLeft: 3,
          })
        })
      ]
    })
  });
}


export default WindowButton;
