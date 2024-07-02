# dotfiles_eww
This is my 2023 dotfile repository, with a huge eww configuration and a hyprland WM.

# Pictures

![Neofetch and *nixporn](https://github.com/EvanKoe/dotfiles_2023/blob/main/pictures/screenshots/neofetch.jpg)
Neofetch and *nixporn  
  
  
![Nvim in maximized mode](https://github.com/EvanKoe/dotfiles_2023/blob/main/pictures/screenshots/nvim.jpg)
Nvim in maximized mode  
  
  
![*nixporn on maximized Chrome](https://github.com/EvanKoe/dotfiles_2023/blob/main/pictures/screenshots/unixporn.jpg)
*Nixporn on maximized Google Chrome  
  
  
![Eww bar that adapts its background color on maximize](https://github.com/EvanKoe/dotfiles_2023/assets/72010109/d1a5cd3e-379e-4ea2-ae36-60023efe7347)
The bar (made with Eww) adapts its background color to the maximized window.


# Details

OS: Arch Linux  
WM: Hyprland (wayland)  
Editor: NeoVim ([from this config](https://github.com/kawaegle/dotfile))  
Bar: [eww](https://github.com/elkowar/eww)  
wallpaper: [this image](https://github.com/EvanKoe/dotfiles_2023/blob/main/pictures/walls/Composition/Cobalt%20Blue.jpg)  
Browser: Google Chrome  
Terminal: [Kitty](https://github.com/kovidgoyal/kitty)  
Shell: ZSH (with [tmux](https://github.com/tmux/tmux/wiki))  
Notification daemon: [Mako](https://github.com/emersion/mako)    
Network manager:  [IWD](https://wiki.archlinux.org/title/iwd)  

# Installation

For the installation, you will need all the softwares that are in my config:    
`kitty eww nvim zsh hyprland google-chrome`  
You may also need a few cli softwares like `wf-recorder`, `slurp` or `grim`, but I cannot list them all because there are many of them for very specific uses.  
Also, as every config, you will need to copy it to your `$HOME` by doing so:  
```
> cp dotfiles_2023/eww $HOME/.config -r
> cp dotfiles_2023/hypr $HOME/.config -r
> cp dotfiles_2023/tmux/* $HOME
> cp dotfiles_2023/pictures $HOME/Pictures -r
```
> Note that by default, the config looks for pictures in `$HOME/Pictures` but you can change it in `eww/config.json`.

Also, I'm trying to implement a dynamically generated dock (see `eww/config.json`), I will push it soon enough !
