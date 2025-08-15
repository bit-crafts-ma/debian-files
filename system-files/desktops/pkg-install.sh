#!/bin/bash

DEBIAN_FRONTEND=noninteractive

#install packages
sudo apt update && sudo apt upgrade -y

sudo apt install -y --no-install-recommends \
  net-tools rsync wget curl dnsutils apt-transport-https ca-certificates git htop gpg-agent linux-headers-amd64 \
  clang clangd clang-tidy clang-tools clang-format gnome-console gnome-core \
  fonts-recommended fonts-font-awesome fonts-dejavu ssh-askpass build-essential make meson ninja-build bison \
  gnupg default-jre  brightnessctl tlp nautils nautilus-extension-gnome-terminal \
  pkg-config cmake make gnome-keyring \
  vlc ffmpeg arc-theme papirus-icon-theme gnome-keyring-pkcs11 \
  wireguard wireguard-tools fonts-cantarell fonts-noto fonts-jetbrains-mono fonts-roboto pbzip2 \
  simple-scan libsecret-1-0 fonts-materialdesignicons-webfont \
  libsecret-tools mdadm mesa-utils texinfo ffmpegthumbnailer \
  gvfs-backends seahorse ufw network-manager network-manager-gnome libfuse2 libfuse3-3 flatpak \
  gnome-shell-extension-appindicator gnome-shell-extension-caffeine \
  gnome-shell-extension-desktop-icons-ng gnome-tweaks gnome-disk-utility gnome-shell-extensions \
  gnome-shell-extensions-extra evince fail2ban unzip ufw

# setup vs codium repository
if dpkg -s codium &>/dev/null; then
  echo "Package codium is installed!"
else
  echo "Package VSCodium is not installed... installing now"
  wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg |
    gpg --dearmor |
    sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

  echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' |
    sudo tee /etc/apt/sources.list.d/vscodium.list

  sudo apt update && sudo apt install codium -y
fi

#setup signal repository
if dpkg -s signal-desktop &>/dev/null; then
  echo "Package signal-desktop is installed!"
else
  echo "Package signal-desktop is NOT installed!"
  wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor >signal-desktop-keyring.gpg
  cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg >/dev/null
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |
    sudo tee /etc/apt/sources.list.d/signal-xenial.list
  sudo apt update && sudo apt install signal-desktop -y
fi

flatpak remote-add --subset=verified --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

if [ ! -d "/data" ]; then
  sudo mkdir -p /data/code
  sudo mkdir -p /data/backups
  sudo mkdir -p /data/archives
fi 

if [ ! -d "$HOME/.config" ]; then
  mkdir -p $HOME/.config
fi

if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p $HOME/.local/bin
fi
 
sudo chown  -R "$USER:$USER" /data
