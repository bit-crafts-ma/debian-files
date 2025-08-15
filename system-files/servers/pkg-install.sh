#!/bin/bash

DEBIAN_FRONTEND=noninteractive
 

#install packages
sudo apt update && sudo apt upgrade -y

sudo apt install -y --no-install-recommends \
  net-tools rsync wget curl dnsutils apt-transport-https ca-certificates git htop linux-headers-amd64 \
  clang clangd clang-tidy clang-tools clang-format \
  build-essential make meson ninja-build bison gnupg  \
  pkg-config cmake make pbzip2 mdadm texinfo ufw fail2ban unzip
