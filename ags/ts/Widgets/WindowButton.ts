const WindowButton = (
  name: string,
  color: string = "#900",
  onPress: (() => void) = () => console.log("Button pressed")
) => Widget.EventBox({
  name: name,
  onPrimaryClick: onPress,
  marginRight: 4,
  widthRequest: 22,
  child: Widget.Box({
    className: 'windowButton',
    css: `background-color: ${color}`
  })
})


export default WindowButton;
