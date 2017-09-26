# dotfiles
My personal dotfile setup

## Dependencies
 * [arc-theme](https://github.com/horst3180/arc-theme)
 * [compton](https://github.com/chjj/compton)
 * [crayolo](https://github.com/dkeg/crayolo)
 * [dunst](https://github.com/knopwob/dunst)
 * [i3-gaps](https://github.com/Airblader/i3/tree/gaps)
 * [i3blocks-gaps](https://github.com/Airblader/i3blocks-gaps)
 * [neofetch](https://github.com/dylanaraps/neofetch)
 * [nmcli-dmenu](https://github.com/firecat53/nmcli-dmenu)
 * [powerline](https://github.com/powerline/powerline)
 * [ranger](https://github.com/ranger/ranger)
 * [rofi](https://github.com/DaveDavenport/rofi)
 * Roboto Mono
 * urxvt
 * [vim-airline](https://github.com/vim-airline/vim-airline)

## Setup
#### General Files
The buildscript will automatically copy all of the files in `config/...` to `~/...`
#### Overrides
If there is no matching override for a given file under `override/$HOSTNAME`, the file will just be copied out.
Otherwise, the override will be inserted, replaced, or appended (whatever command you tell it to use) to the config file.
