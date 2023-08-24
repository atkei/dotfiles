#!/usr/bin/env bash

set -e

sudo apt -y update

sudo apt install -y \
  vim \
  zsh \
  git \
  zip \
  unzip \
  direnv \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  curl \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  tmux \
  xsel \
  ca-certificates \
  curl \
  gnupg \
  fonts-noto-cjk \
  fonts-noto-cjk-extra

exit 0
