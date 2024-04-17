#!/usr/bin/env bash

set -e

# Jetbrains IDE
sudo snap install intellij-idea-ultimate --classic
sudo snap install pycharm-professional --classic
sudo snap install clion --classic
sudo snap install goland --classic

# Neovim
sudo snap install nvim --classic

# Visual Studio Code
sudo snap install code --classic

exit 0
