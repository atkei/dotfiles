# Neovim

## Install Neovim

https://github.com/neovim/neovim#install-from-package

## Install Pynvim

Require pyenv-virtualenv ([Python](python.md)).

https://github.com/neovim/pynvim#install

Create a virtualenv with the name `nvim3`.  
For example, if Python 3.9.7 is already installed with pyenv.

```sh
pyenv virtualenv 3.9.7 nvim3
pyenv activate nvim3
pip install pynvim
```

Need to edit the following line in [`init.vim`](../.config/nvim/init.vim) if changing virtualenv name from the above.

```sh
let g:python3_host_prog = $PYENV_ROOT.'/versions/nvim3/bin/python'
```

## Install dein.vim

https://github.com/Shougo/dein.vim#quick-start
