#!/usr/bin/env bash

echo "Removing items added by script...";
{
gnome-extensions disable "animation-tweaks@Selenium-H";
gnome-extensions disable "dash-to-panel@jderose9.github.com";
gnome-extensions disable "arc-menu@linxgem33.com";
} > /dev/null 2>&1

echo "Restoring default looks...";
{
gnome-extensions enable "ubuntu-dock@ubuntu.com";
gsettings set org.gnome.desktop.interface icon-theme "Yaru";
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-dark";
gsettings set org.gnome.shell.extensions.user-theme name "Yaru-dark";
gsettings set org.gnome.desktop.background picture-uri /usr/share/backgrounds/warty-final-ubuntu.png

} > /dev/null 2>&1

echo "All Done!";
echo "Logout and re-login for changes to take effect";
