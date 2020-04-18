#!/usr/bin/env bash
PICTURES_FOLDER=$(xdg-user-dir PICTURES)
sudo apt install apt -y make gnome-shell-extensions gnome-tweak-tool gnome-menus gettext libgettextpo-dev

#-- Install Animation Tweaks  ------------------------------------
git clone "https://github.com/Selenium-H/Animation-Tweaks.git";
cd "Animation-Tweaks/";
chmod +x INSTALL.sh && ./INSTALL.sh;
gnome-extensions enable "animation-tweaks@Selenium-H";

#-- Install Dash to Panel  ------------------------------------
git clone "https://github.com/home-sweet-gnome/dash-to-panel.git";
cd "dash-to-panel/";
make install;
gnome-extensions enable "dash-to-panel@jderose9.github.com";

#-- Install Arc Menu  ------------------------------------
git clone "https://gitlab.com/LinxGem33/Arc-Menu.git";
cd "Arc-Menu/";
make install;
gnome-extensions enable "arc-menu@linxgem33.com";

#-- Install User Themes  ------------------------------------
gnome-extensions enable "user-theme@gnome-shell-extensions.gcampax.github.com";

#-- Windows 10 Icons, Wallpaper and Theme ------------------------------------
[[ -e ~/.local/share/themes ]] || mkdir -p ~/.local/share/themes
[[ -e ~/.local/share/icons ]] || mkdir -p ~/.local/share/icons
cd /tmp && wget -N https://github.com/B00merang-Project/Windows-10/archive/master.zip && unzip -o master.zip -d ~/.local/share/themes/
cd /tmp && wget https://cdn.wallpaperhub.app/cloudcache/7/c/2/f/3/4/7c2f345bdfcadb8a3faf483ebaa2e9aea712bbdb.jpg && mv 7c2f345bdfcadb8a3faf483ebaa2e9aea712bbdb.jpg "$PICTURES_FOLDER"/wallpaper-windows.png
cd /tmp && wget https://github.com/c-thun/10ify/blob/master/icons8-windows-10-symbolic.svg && mv icons8-windows-10-symbolic.svg "$PICTURES_FOLDER"/icons8-windows-10-symbolic.svg
gsettings set org.gnome.desktop.background picture-uri file:///"$PICTURES_FOLDER"/wallpaper-windows.png

#-- Copy schemas ------------------------------------
sudo cp ~/.local/share/gnome-shell/extensions/arc-menu@linxgem33.com/schemas/org.gnome.shell.extensions.arc-menu.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/org.gnome.shell.extensions.dash-to-panel.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/animation-tweaks@Selenium-H/schemas/org.gnome.shell.extensions.animation-tweaks.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas/

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

#-- Finally set custom settings ------------------------------------

#-- Configure Dash to Panel  ------------------------------------
gsettings set org.gnome.shell.extensions.dash-to-panel taskbar-position 'LEFTPANEL'
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-fixed-y true
gsettings set org.gnome.shell.extensions.dash-to-panel peek-mode-opacity 40
gsettings set org.gnome.shell.extensions.dash-to-panel dot-style-focused 'METRO'
gsettings set org.gnome.shell.extensions.dash-to-panel show-window-previews true
gsettings set org.gnome.shell.extensions.dash-to-panel panel-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-panel showdesktop-button-width 8
gsettings set org.gnome.shell.extensions.dash-to-panel dot-style-unfocused 'METRO'
gsettings set org.gnome.shell.extensions.dash-to-panel panel-size 42
gsettings set org.gnome.shell.extensions.dash-to-panel progress-show-bar true
gsettings set org.gnome.shell.extensions.dash-to-panel group-apps-use-fixed-width true
gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-custom-gradient true
gsettings set org.gnome.shell.extensions.dash-to-panel trans-gradient-top-opacity 0.20000000000000001
gsettings set org.gnome.shell.extensions.dash-to-panel window-preview-padding 8
gsettings set org.gnome.shell.extensions.dash-to-panel animate-app-switch true
gsettings set org.gnome.shell.extensions.dash-to-panel animate-window-launch true
gsettings set org.gnome.shell.extensions.dash-to-panel trans-panel-opacity 0.40000000000000002
gsettings set org.gnome.shell.extensions.dash-to-panel show-activities-button false
gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-dynamic-opacity false
gsettings set org.gnome.shell.extensions.dash-to-panel trans-gradient-bottom-opacity 0.5
gsettings set org.gnome.shell.extensions.dash-to-panel trans-use-custom-opacity true

#-- Configure User Theme  ------------------------------------
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
gsettings set org.gnome.desktop.interface icon-theme "Windows-10-Icons-master"
gsettings set org.gnome.desktop.interface gtk-theme "Windows-10-master"
gsettings set org.gnome.shell.extensions.user-theme name "Windows-10-master"

#-- Configure Arc Menu  ------------------------------------
gsettings set org.gnome.shell.extensions.arc-menu custom-menu-button-icon '"$PICTURES_FOLDER"/icons8-windows-10-symbolic.svg'
gsettings set org.gnome.shell.extensions.arc-menu position-in-panel 'Left'
gsettings set org.gnome.shell.extensions.arc-menu menu-layout 'Whisker'
gsettings set org.gnome.shell.extensions.arc-menu show-lock-button true
gsettings set org.gnome.shell.extensions.arc-menu enable-custom-arc-menu-layout true
gsettings set org.gnome.shell.extensions.arc-menu menu-height 550
gsettings set org.gnome.shell.extensions.arc-menu menu-button-active-color 'rgb(255,255,255)'
gsettings set org.gnome.shell.extensions.arc-menu menu-color 'rgb(25,31,34)'
gsettings set org.gnome.shell.extensions.arc-menu menu-foreground-color 'rgb(189,230,251)'
gsettings set org.gnome.shell.extensions.arc-menu arc-menu-placement 'DTP'
gsettings set org.gnome.shell.extensions.arc-menu custom-menu-button-icon-size 25.0
gsettings set org.gnome.shell.extensions.arc-menu menu-button-color 'rgb(255,255,255)'
gsettings set org.gnome.shell.extensions.arc-menu button-icon-padding 2
gsettings set org.gnome.shell.extensions.arc-menu dtp-dtd-state [true, false]
gsettings set org.gnome.shell.extensions.arc-menu disable-activities-button false
gsettings set org.gnome.shell.extensions.arc-menu override-hot-corners false
gsettings set org.gnome.shell.extensions.arc-menu menu-button-icon 'Custom_Icon'

#-- Configure Animations ------------------------------------
gsettings set org.gnome.shell.extensions.animation-tweaks wayland true
gsettings set org.gnome.shell.extensions.animation-tweaks unminimizing-effect true
gsettings set org.gnome.shell.extensions.animation-tweaks normal-minimize ['|', 'T', 'Squeezed Slide Vertically', '2', '255', '1', '1', 'SX', 'SY', '0.300', '0', '1', '255', 'MW', '0', 'MX', '1', '0.00', '0', '0', '255', '0', '0', 'MX', 'mY']
gsettings set org.gnome.shell.extensions.animation-tweaks minimizing-effect true
gsettings set org.gnome.shell.extensions.animation-tweaks normal-unminimize ['|', 'T', 'Squeezed Slide Vertically', '2', '255', 'MW', '0.8', 'MX', 'mY', '0.00', '0', '0', '255', '0', '0', 'MX', 'IY', '0.250', '0', '1', '255', '1', '1', 'IX', 'IY']

echo "Logout and re-login for changes to take effect";
