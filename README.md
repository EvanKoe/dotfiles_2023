# My 2023-2025 dotfiles

# Pictures

![Screenshot](https://github.com/user-attachments/assets/ccbe8d1c-dd5a-4c59-a5ec-ff8217f06b38)

![image](https://github.com/user-attachments/assets/cc6b48b8-7a9b-4029-aa91-a70564c4c405)


# Details

OS: Arch Linux  
WM: Hyprland (wayland)  
Editor: NeoVim  
Bar: [AGS](https://aylur.github.io/ags/)  
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

> Please note that I use [hyprpm](https://github.com/hyprwm/hyprland-plugins) to load hyprland plugins, and thus, you should also install it for window bars to work !
