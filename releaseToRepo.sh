#!/bin/bash
echo "This script will build, sign and push $(arch) packages to the repository."
echo "Script need to be launched at the root of the git repo plainDE/build-scripts"
read -p "Input release version (example: 0.1.3): " RELEASEVER

bash ./buildArch.sh # build and sign pacman packages

git clone git@github.com:plainDE/linux-repo.git # get current repository

mv *.tar.* linux-repo/arch/$(uname -m)/
cd linux-repo/arch/$(uname -m)
rm -rf *
repo-add --verify --sign plainDE.db.tar.zst *.tar.zst *.tar.gz
git add *

git commit -a -S -m "Update $(uname -m) packages to $RELEASEVER"

echo "Please check latest commit to repo, and then push it"
