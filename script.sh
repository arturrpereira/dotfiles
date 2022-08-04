#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install alsa-utils brightnessctl chromium cmatrix curl gimp i3blocks i3status make meson neofetch neovim network-manager sudo thunar tmux uzip xfce4-power-manager xfce4-terminal xinput xorg zsh -y

#Conectar ao wifi pelo network manager
#nmcli r wifi on
#nmcli d wifi connect --nome-da-rede password --password

#Colocar o usuário no grupo de sudo
#Colocar contrib non-free no sources.list
#Instalar os firmwares que faltam

#Ir para a pasta de repositorios e rodas os seguintes comandos

#git clone hhtps://www.github.com/Airblader/ i3 i3-gaps
#cd i3-gaps
#mkdir -p build && cd build
#meson ..
#ninja 
#sudo ninja install

