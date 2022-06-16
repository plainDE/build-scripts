#!/bin/sh

# Get PKGBUILDs
git clone https://aur.archlinux.org/plainpanel.git
git clone https://aur.archlinux.org/plainabout.git
git clone https://aur.archlinux.org/plaincontrolcenter.git
git clone https://aur.archlinux.org/plainde-meta.git

# Build and sign everything

cd plainpanel
makepkg --sign
cp *.tar.zst* ../
cd ..

cd plainabout
makepkg --sign
cp *.tar.zst* ../
cd ..

cd plaincontrolcenter
makepkg --sign
cp *.tar.zst* ../
cd ..

cd plainde-meta
makepkg --sign
cp *.tar.zst* ../
cd ..

# Cleanup

rm -rf plainpanel plainabout plaincontrolcenter plainde-meta
