#!/bin/bash

readonly AccentColorLight="0678AB"
readonly AccentColorDark="03B9E4"
readonly GnomeShellCloseLight="820000"
readonly GnomeShellCloseDark="CC0000"
readonly GnomeShellFont="Cantarell" #comment lines 86&87 to use default
readonly Path="/usr/share/themes"

### Some colors
## Material Design palette -> https://www.materialui.co/colors
## Fluent Design palette -> https://fluentcolors.com
## Arch blue = 1793D1
## Crunchbang dark = 2E3436
## Crunchbang light = BFBFBF
## Debian red = D70A53
## Fedora blue = 3C6EB4
## Gentoo purple = 54487A
## openSUSE lightgreen = 73BA25
## openSUSE darkgreen = 6DA741
## openSUSE lightcyan = 35B9AB
## openSUSE darkcyan = 00A489
## Pop OS brown = 574F4A
## Pop OS cyan = 48B9C7
## Pop OS yellow = FAA41A
## RedHat lightred = CC0000
## RedHat darkred = 820000
## RedHat lightblue = 03B9E4
## RedHat darkblue = 0678AB
## SteamOS green = 5C7E10
## SteamOS bluedark = 252C3F
## SteamOS bluelight = 6699FF
## SUSE green = 02D35F
## Ubuntu orange = E95420
## Ubuntu purple = 772953
## Ubuntu Budgie blue = 4D90D6
## Ubuntu Budgie red = A34F6D
## Ubuntu Budgie slate = 383C4A
## Ubuntu MATE green = 87A556
## Ubuntu MATE red = DD4814
## GNOME Adwaita beige = DBD1C7
## GNOME Adwaita blue = 3584E4
## KDE Plasma blue = 3DAEE9
## Windows select blue = 1979CA
## Windows folder yellow = FFE18C
## MiamiVice bluegreen = 0BD3D3
## MiamiVice pink = F890E7
## Apple website blue = 0070C9
## Apple website green = 47B04B
## Apple website grey = 888888
## Apple website orange = E85D00
## Apple website red = CF102D
## Bondi Blue = 0095B6
## Bootstrap purple = 7952B3
## Bootstrap yellow = FFE484
## Bootstrap grey = 6C757D
## Bulma green = 00D1B2
## Lamborghini gold = DDB321
## Mozilla MDN blue = 3D7E9A
## Mozilla MDN grey = 9B9B9B
## Mozilla MDN red = E66465
## Mozilla MDN yellow = F6B73C
## Mozilla MDN green = 4D9F0C
## OnePlus red = EB0029
## VALVe brown = 745E4E
## VALVe green = D3D6CA
## VALVe orange = CF381E
## Pantone rose quartz = F7CAC9
## Pantone serenity = 92A8D1
## Sherwin taupe = 8C7E78
## Gunmetal = 2C3539
## Graphite = 577287
## https://www.materialui.co/flatuicolors

if [ -w "$Path" ]
then
  rm -rf "$PathMateria*"
else
  sudo rm -rf "$PathMateria*"
fi

wget -O - https://github.com/nana-4/materia-theme/archive/master.tar.gz | tar xz
cd materia-theme-master

sleep 2s

sed -i "s/Roboto, \"M+ 1c\"/$GnomeShellFont/g" src/_sass/gnome-shell/_variables.scss
sed -i "s/\"M+ 1c\", Roboto/$GnomeShellFont/g" src/_sass/gnome-shell/_variables.scss

sed -i "s/1A73E8/$AccentColorLight/gI" src/_sass/_colors.scss
sed -i "s/1A73E8/$AccentColorLight/gI" src/gnome-shell/assets/*.svg
sed -i "s/1A73E8/$AccentColorLight/gI" src/gtk/assets.svg
sed -i "s/1A73E8/$AccentColorLight/gI" src/gtk-2.0/assets.svg
sed -i "s/1A73E8/$AccentColorLight/gI" src/gtk-2.0/gtkrc{,-light}
sed -i "s/1A73E8/$AccentColorLight/gI" src/cinnamon/*.scss
sed -i "s/1A73E8/$AccentColorLight/gI" src/cinnamon/assets/*.svg
sed -i "s/1A73E8/$AccentColorLight/gI" src/xfwm4/assets/*.svg
sed -i "s/1A73E8/$AccentColorLight/gI" src/xfwm4/assets-light/*.svg

sed -i "s/8AB4F8/$AccentColorDark/gI" src/_sass/_colors.scss
sed -i "s/8AB4F8/$AccentColorDark/gI" src/gnome-shell/assets-dark/*.svg
sed -i "s/8AB4F8/$AccentColorDark/gI" src/gtk/assets.svg
sed -i "s/8AB4F8/$AccentColorDark/gI" src/gtk-2.0/assets-dark.svg
sed -i "s/8AB4F8/$AccentColorDark/gI" src/gtk-2.0/gtkrc-dark
sed -i "s/8AB4F8/$AccentColorDark/gI" src/cinnamon/*.scss
sed -i "s/8AB4F8/$AccentColorDark/gI" src/cinnamon/assets/*.svg
sed -i "s/8AB4F8/$AccentColorDark/gI" src/xfwm4/assets/*.svg
sed -i "s/8AB4F8/$AccentColorDark/gI" src/xfwm4/assets-light/*.svg

sed -i "s/D93025/$GnomeShellCloseLight/gI" src/gnome-shell/assets/window-close{,-active}.svg
sed -i "s/F28B82/$GnomeShellCloseDark/gI" src/gnome-shell/assets-dark/window-close{,-active}.svg

sleep 2s

./parse-sass.sh
./render-assets.sh

chmod +x install.sh
if [ -w "$Path" ]
then
  ./install.sh -d "$Path"
else
  sudo ./install.sh -d "$Path"
fi

sleep 2s

cd ..
rm -rf materia-theme-master

clear
printf "Kolorized! You can change your gtk theme now.\nRestarting your session may be necessary.\n"
read -p "Press ENTER to close."
