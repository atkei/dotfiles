#!/usr/bin/env bash

set -e

sudo apt -y update

sudo apt install -y \
  build-essential \
  ca-certificates \
  cmake \
  curl \
  direnv \
  fonts-noto-cjk \
  fonts-noto-cjk-extra \
  fuse \
  git \
  gnupg \
  libbz2-dev \
  libffi-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxmlsec1-dev \
  libxml2-dev \
  liblzma-dev \
  ninja-build \
  tk-dev \
  tmux \
  unzip \
  vim \
  xsel \
  xz-utils \
  zip \
  zlib1g-dev \
  zsh

exit 0
