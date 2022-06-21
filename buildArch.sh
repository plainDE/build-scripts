#!/bin/sh

# Get PKGBUILDs
git clone https://aur.archlinux.org/plainpanel.git
git clone https://aur.archlinux.org/plainabout.git
git clone https://aur.archlinux.org/plaincontrolcenter.git
git clone https://aur.archlinux.org/plainde-meta.git
git clone https://aur.archlinux.org/plainbase.git
git clone https://aur.archlinux.org/plainartwork.git

# Build and sign everything

cd plainbase
makepkg --sign
cp *.tar.* ../
cd ..

cd plainartwork
makepkg --sign
cp *.tar.* ../
cd ..

cd plainpanel
makepkg --sign
cp *.tar.* ../
cd ..

cd plainabout
makepkg --sign
cp *.tar.* ../
cd ..

cd plaincontrolcenter
makepkg --sign
cp *.tar.* ../
cd ..

cd plainde-meta
makepkg --sign
cp *.tar.* ../
cd ..

# Cleanup

rm -rf plainpanel plainabout plaincontrolcenter plainde-meta plainbase plainartwork
