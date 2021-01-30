#!/bin/bash

# Initial cleanup and update
sudo apt update
sudo apt upgrade -y

# Remove unwanted character map app
sudo apt autoremove --purge gucharmap -y

# Install basic tooling
sudo apt install -y neofetch tty-clock htop lolcat figlet toilet ranger vim curl wget build-essential git pdftk

# Install GUI apps
sudo apt install -y gnome-tweaks gnome-characters chrome-gnome-shell transmission-gtk xournal code

# Replace Geary with Evolution (with support for Exchange accounts)
sudo apt autoremove --purge geary
sudo apt install evolution evolution-ews

# Install Spotify (flatpak)
flatpak install --assumeyes flathub com.spotify.Client

# Install TeXlive system
sudo apt install -y texlive-base texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-xetex texlive-bibtex-extra texlive-fonts-recommended texlive-fonts-extra texlive-lang-english texlive-lang-italian texlive-pictures texlive-science texlive-pstricks latexmk dvipng

# Install Ruby system
sudo apt install -y ruby ruby-dev
echo '# Install Ruby Gems to $HOME/.gems' >> $HOME/.bashrc
echo 'export GEM_HOME="$HOME/.gems"' >> $HOME/.bashrc
echo 'export PATH="$HOME/.gems/bin:$PATH"' >> $HOME/.bashrc

# Fix (most) QT apps look
sudo apt install -y qt5-gtk-platformtheme qt5-gtk2-platformtheme
echo 'QT_QPA_PLATFORMTHEME=gtk3' | sudo tee -a /etc/environment

# Make Firefox use Xinput
echo 'export MOZ_USE_XINPUT2=1' | sudo tee -a /etc/profile.d/use-xinput2.sh

# Install BpyTOP
sudo apt install -y python3-pip
pip install bpytop
echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc

# Download and install Cascadia Code (from GitHub)
wget --directory-prefix=$HOME/Downloads https://github.com/microsoft/cascadia-code/releases/download/v2009.22/CascadiaCode-2009.22.zip --quiet --show-progress
mkdir $HOME/Downloads/Cascadia
unzip $HOME/Downloads/CascadiaCode-2009.22.zip -d $HOME/Downloads/Cascadia
sudo mkdir /usr/share/fonts/truetype/Cascadia
sudo cp $HOME/Downloads/Cascadia/ttf/static/*.ttf /usr/share/fonts/truetype/Cascadia
rm $HOME/Downloads/Cascadia -rf

# Download and install JetBrains Mono
wget --directory-prefix=$HOME/Downloads https://download.jetbrains.com/fonts/JetBrainsMono-2.221.zip --quiet --show-progress
mkdir $HOME/Downloads/JetBrainsMono
unzip $HOME/Downloads/JetBrainsMono-2.221.zip -d $HOME/Downloads/JetBrainsMono
sudo mkdir /usr/share/fonts/truetype/JetBrainsMono
sudo cp $HOME/Downloads/JetBrainsMono/fonts/ttf/*.ttf /usr/share/fonts/truetype/JetBrainsMono
rm $HOME/Downloads/JetBrainsMono -rf

# Update fontconfig's cache
sudo fc-cache -fv
