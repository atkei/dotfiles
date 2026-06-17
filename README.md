# Dotfiles

[![Bootstrap Test](https://github.com/atkei/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/atkei/dotfiles/actions/workflows/ci.yml)

Personal dotfiles and bootstrap scripts for development environment setup.

## Environments

- Ubuntu 24.04
- macOS

## Prerequisites

### macOS

- [Homebrew](https://brew.sh/)

## Usage

### Full Bootstrap

Sets up the complete development environment including dotfiles, shell, and tools.

```sh
./bootstrap/bootstrap.sh
```

### Install Dotfiles Only

Creates symlinks for dotfiles without installing tools.

```sh
./install.sh
```

## Neovim

A minimal, hand-rolled Neovim config lives in `.config/nvim/init.lua` (managed
via symlink by `install.sh`). Requires Neovim >= 0.10.1.

- **Plugin manager:** [lazy.nvim](https://github.com/folke/lazy.nvim) — bootstraps itself and installs plugins on first `nvim` launch.
- **Fuzzy finder:** [fzf-lua](https://github.com/ibhagwan/fzf-lua) — `<leader>ff` files, `<leader>fg` live grep, `<leader>fb` buffers.
- **Syntax:** Treesitter.
- **Markdown:** [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) for in-buffer viewing; [live-preview.nvim](https://github.com/brianhuster/live-preview.nvim) for browser preview (`<leader>mp`).

After the first launch, commit the generated `.config/nvim/lazy-lock.json` to pin plugin versions.
