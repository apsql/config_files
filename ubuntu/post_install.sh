#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root"
 exit 1
fi


# Update and Upgrade  =========================================================
echo "Updating and Upgrading"
sudo apt update && sudo apt upgrade -y


# Install Communitheme from Snap store  =======================================
echo 'Installing Communitheme'
sudo snap install communitheme


# Installing packages from APT  ===============================================
echo 'Installing general utilities & tools'
sudo apt install -y \
git \
build-essential \
gdebi \
synaptic


echo 'Installing theming packages via APT'
sudo apt install -y \
breeze-gtk-theme \
materia-gtk-theme \
papirus-icon-theme \
qt5-style-plugins \
qt5ct

echo 'Installing fonts via APT'
sudo apt install -y \
fonts-firacode \
fonts-noto-mono \
fonts-hack \
fonts-dejavu \
fonts-noto \
fonts-roboto \
fonts-roboto-slab \
ttf-mscorefonts-installer

echo 'Installing TeXlive packages via APT'
sudo apt install -y \
texlive-base \
texlive-bibtex-extra \
texlive-fonts-recommended \
texlive-fonts-extra \
texlive-lang-english \
texlive-lang-italian \
texlive-latex-base \
texlive-pictures \
texlive-science \
texlive-pstricks \
texstudio

echo 'Installing Python3 packages via APT'
sudo apt install -y \
python3-numpy \
python3-scipy \
python3-matplotlib \
python3-sympy \
python3-pandas \
python3-numba \
python3-xlrd \
ipython3 \
jupyter \
jupyter-notebook \
spyder3


# Fix QT5 widget theme in applications  =======================================
sudo echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment


# Installing .deb files from the internet  ====================================
echo 'Installing Spotify'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
sudo echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client


# Downloading DEB files  ======================================================
echo 'Downloading Telegram'
wget -qP ~/Downloads https://telegram.org/dl/desktop/linux --show-progress

echo 'Downloading Visual Studio Code'
wget -qP ~/Downloads https://go.microsoft.com/fwlink/?LinkID=760868 --show-progress

echo 'Downloading Steam'
wget -qP ~/Downloads https://steamcdn-a.akamaihd.net/client/installer/steam.deb --show-progress


# Downloading fonts found on the web  =========================================
echo 'Downloading additional fonts'
mkdir ~/Downloads/Fira
mkdir ~/Downloads/RobotoMono

wget -qP - ~/Downloads/ https://github.com/mozilla/Fira/archive/4.202.zip fira.zip --show-progress

wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-Bold.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-BoldItalic.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-Italic.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-Light.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-LightItalic.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-Medium.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-MediumItalic.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-Regular.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-Thin.ttf --show-progress
wget -qP ~/Downloads/RobotoMono/ https://github.com/google/fonts/tree/master/apache/robotomono/RobotoMono-ThinItalic.ttf --show-progress


# Extracting ZIPs and putting fonts to /usr/share/fonts/truetype/  ============
cd ~/Downloads
echo 'Installing downloaded fonts to /usr/share/fonts/truetype/'
unzip -jq fira.zip ./Fira/

sudo mv ./SourceCodePro /usr/share/fonts/truetype/SourceCodePro/
sudo mv ./Fira /usr/share/fonts/truetype/Fira/
sudo mv ./RobotoMono /usr/share/fonts/truetype/RobotoMono/

cd ~


# Rebuilding font cache  ======================================================
sudo fc-cache -v
