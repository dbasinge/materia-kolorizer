> **Upstream Materia changes often, I'm sorry if the script is outdated when you download it...**
> 
> ---- _(latest sync: 7th march 2020)_

---

![title](materiaK-title.gif)

---
---
---

:information_source: **Need matching icons and wallpapers?
Check [papirus-kolorizer](https://github.com/DarthWound/papirus-kolorizer) and [wallpaper-kolorizer](https://github.com/DarthWound/wallpaper-kolorizer)!**

--- You can use "[all-in-one kolorizer](https://gist.github.com/DarthWound/01697d659b9f17dd4159b68b13745dfa)" script to get everything.

---
---
---

This bash script provides an easy way to change [Materia GTK theme](https://github.com/nana-4/materia-theme) accent colors.

![showcase](kolorizerSW.gif)

-> [fullsize screenshot 1](kolorizerSC.png?raw=true) *(bootstrap purple + wp-foxy)*

-> [fullsize screenshot 2](kolorizerSK.png?raw=true) *(bulma green + wp-angly)*

-> [fullsize screenshot 3](kolorizerSG.png?raw=true) *(graphite + wp-aqueousy)*

## Materia build requirements

- Sass
- Inkscape
- Optipng
- GTK2 Murrine engine

Fedora: `sudo dnf install gtk-murrine-engine inkscape optipng sassc`

## Installation

```
cd $(xdg-user-dir DOWNLOAD)
wget https://raw.githubusercontent.com/DarthWound/materia-kolorizer/master/materia-kolorizer.sh
chmod +x materia-kolorizer.sh
```

You don't have to download Materia, the script does everything for you.

## Usage

> If the original Materia theme was already installed from your distro repos, please remove it first.

Modify the script to set your own colors *(only the variables starting with "readonly")*.

Then launch it:

```
cd $(xdg-user-dir DOWNLOAD) && ./materia-kolorizer.sh
```

*It will replace your existing Materia installation if any.*

*PS: I know that there is a script provided by Materia (and Oomox utility) to create custom themes, the difference here is that we only change primary/accent colors and keep Materia theme (+variants) totally intact.*
