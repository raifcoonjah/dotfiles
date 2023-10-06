#!/bin/bash

echo "**************************"
echo "Cuttyflam - Install script"
echo "***************************"


echo "Creating a backup of initial mirrorlist (require root)"
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.initial


# Add mirror lines to mirrorlist file
echo "[Adding mirror lines to mirrorlist] *****************************************************************************************************************************************************************"
echo "## Mauritius (cloud.mu)" | sudo tee -a /etc/pacman.d/mirrorlist
echo "Server = https://archlinux-mirror.cloud.mu/\$repo/os/\$arch" | sudo tee -a /etc/pacman.d/mirrorlist
echo "## Mauritius (cloud.mu)" | sudo tee -a /etc/pacman.d/mirrorlist
echo "Server = http://archlinux-mirror.cloud.mu/\$repo/os/\$arch" | sudo tee -a /etc/pacman.d/mirrorlist
echo "## South Africa mirror" | sudo tee -a /etc/pacman.d/mirrorlist
echo "Server = http://archlinux.za.mirror.allworldit.com/archlinux/\$repo/os/\$arch" | sudo tee -a /etc/pacman.d/mirrorlist


# Function to install packages from a file using pacman
install_packages() {
    while IFS= read -r package; do
        sudo pacman -S --noconfirm "$package"
    done < "$1"
}

# Function to configure Git
configure_git() {

    # Set Git configuration
    git config --global user.name "Raif Coonjah"
    git config --global user.email "raifcoonjah@proton.me"

    echo "Git configuration set:"
    git config --list
}

aur_apps() {
    cd /tmp
    mkdir yay-installer
    cd yay-installer
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    # Apps
    yay -S heroic-games-launcher-bin vscodium-bin
}

setup_dev() {
    # Oh my zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # ZSH Plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

    # Docker
    sudo usermod -aG docker $(whoami)
    sudo systemctl enable docker
    sudo systemctl start docker
    newgrp docker

    # Vagrant
    # sudo systemctl start --now libvirtd.service
    # vagrant plugin install vagrant-libvirt
    # cd ~/
    # mkdir .dev
    # cd .dev
    # mkdir vagrant
    # cd vagrant
    # mkdir UbuntuLTS
    # cd UbuntuLTS
    # vagrant init generic/debian12
    # cd ..
    # mkdir ArchLinux
    # cd ArchLinux
    # vagrant init generic/arch
    

}



# Install packages from different sources
echo "[Installing from apps.txt] *****************************************************************************************************************************************************************"
install_packages "apps.txt"
echo "[Installing from flatpak.txt] *****************************************************************************************************************************************************************"
install_packages "flatpak.txt"
echo "[Installing from gaming.txt] *****************************************************************************************************************************************************************"
install_packages "gaming.txt"

echo "[GIT Config] *****************************************************************************************************************************************************************"
configure_git

echo "[Installing AUR apps] *****************************************************************************************************************************************************************"
aur_apps

echo "[Setting up development] *****************************************************************************************************************************************************************"
install_packages "dev.txt"
setup_dev