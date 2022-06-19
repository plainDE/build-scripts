#!/bin/bash
echo "This script will build, sign and push $(arch) packages to the repository."
echo "Script need to be launched at the root of the git repo plainDE/build-scripts"
read -p "Input release version (example: 0.1.3): " RELEASEVER

bash ./buildArch.sh # build and sign pacman packages

git clone git@github.com:plainDE/linux-repo.git # get current repository

mv *tar* linux-repo/arch/$(arch)/
cd linux-repo/arch/$(arch)
repo-add --verify --sign plainDE.db.tar.zst *tar*
rm -rf *old*

git add *

git commit -a -S -m "Update $(arch) packages to $RELEASEVER"

# git push
