#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install alsa-utils brightnessctl chromium cmatrix curl gimp i3status make meson neofetch neovim network-manager sudo thunar tmux unzip xfce4-power-manager xfce4-terminal xinput xorg zsh -y
#i3blocks 
sudo apt install dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev

#Conectar ao wifi pelo network manager
#nmcli r wifi on
#nmcli d wifi connect --nome-da-rede password --password

#Colocar o usuário no grupo de sudo
#Colocar contrib non-free no sources.list
#Instalar os firmwares que faltam

#Ir para a pasta de repositorios e rodas os seguintes comandos

cd
cd Repos
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
mkdir -p build && cd build
meson ..
ninja 
sudo ninja install
