# Setup Procedure for Dotfiles

Checked environments

- Pop!_OS 22.04 (x86_64)
- Ubuntu 22.04 (x86_64)

Note: This is a personal note and full compatibility is not guaranteed.

## Update Packages

```sh
sudo apt update
```

## Install Zsh

```sh
sudo apt install zsh
chsh -s $(which zsh)
```

Ref: https://www.zsh.org/

## Install Prezto

```sh
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB

# Do not replace existing links.
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

Ref: https://github.com/sorin-ionescu/prezto

## Install Tmux

```sh
sudo apt install tmux
```

Rrf: https://github.com/tmux/tmux#installation

## Install Tmux Plugin Manager (TPM)

When ubuntu22, need the following.

```sh
sudo apt install xsel
```

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Open a tmux session then press `prefix` + `I` to install plugins.

Ref: https://github.com/tmux-plugins/tpm#installation

## Install fzf

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf
git fetch all tags
git checkout refs/tags/0.37.0
./install
...
Do you want to enable fuzzy auto-completion? ([y]/n) y
Do you want to enable key bindings? ([y]/n) y
Do you want to update your shell configuration files? ([y]/n) n
...
```

Ref: https://github.com/junegunn/fzf#installation

## Install ripgrep

```sh
sudo apt install ripgrep
```

Ref: https://github.com/BurntSushi/ripgrep#installation


## Install SDKMAN!

```sh
sudo apt install zip unzip
curl -s "https://get.sdkman.io" | bash
source ~/.zshrc
```

Ref: https://sdkman.io/install'

## Install pyenv

```sh
export PYENV_GIT_TAG=v2.3.12
curl https://pyenv.run | bash
source ~/.zprofile
source ~/.zshrc
```

Ref:
- https://github.com/pyenv/pyenv#installation
- https://github.com/pyenv/pyenv-installer#installation--update--uninstallation

## Install Python (system's global version)

Install dependencies to build python.

```sh
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

Install python then set to the system's global version.

```sh
pyenv install 3.10.9
pyenv global 3.10.9
```

Ref: https://github.com/pyenv/pyenv/wiki#troubleshooting--faq

## Install nvm

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.zshrc
```

Ref: https://github.com/nvm-sh/nvm#installing-and-updating

## Install Node.js (system's global version)

```sh
nvm install 18.14.0
```

## Install goenv

```sh
git clone https://github.com/syndbg/goenv.git ~/.goenv
source ~/.zprofile
source ~/.zshrc
```

Ref: https://github.com/syndbg/goenv/blob/master/INSTALL.md

## Install Pynvim

```sh
pyenv virtualenv 3.10.9 nvim3
pyenv activate nvim3
pip install pynvim
```

Ref: https://github.com/neovim/pynvim#install

## Install Neovim

```sh
wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
source ~/.zshrc
```

Ref: https://github.com/neovim/neovim#install-from-package

## Install AWS CLI

```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

Ref: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

## Install awsp

```sh
npm install -g awsp
```

Ref: https://github.com/johnnyopao/awsp#setup

## Install Github CLI

```sh
pe -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

Enable completion.

```sh
gh completion -s zsh | sudo tee /usr/local/share/zsh/site-functions/_gh
source ~/.zshrc
```

## Install JetBrains IDEs

Use [JetBrains ToolBox](https://www.jetbrains.com/toolbox-app/) or install as a snap package.

```sh
sudo snap install intellij-idea-ultimate --classic
```

Ref: https://www.jetbrains.com/help/idea/installation-guide.html

## Install Docker, Containerd and Docker Compose

```sh
sudo apt-get update
sudo apt-get install \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Enable rootless mode.

```sh
sudo apt-get install -y uidmap
dockerd-rootless-setuptool.sh install
```

Ref:
- https://docs.docker.com/engine/install/ubuntu/
- https://docs.docker.com/engine/security/rootless/#install

## Install Minikube

Install.

```sh
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

Enable completion.

```sh
minikube completion zsh | sudo tee /usr/local/share/zsh/site-functions/_minikube
source ~/.zshrc
```

### Enabling cgroup v2

Enable as needed for minikube with rootless docker driver.

#### GRUB

Add the following string to the `GRUB_CMDLINE_LINUX` line in `/etc/default/grub`.  
For example,

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash systemd.unified_cgroup_hierarchy=1"
```

Run the following then reboot.

```sh
sudo update-grub
```

#### kernelstub (Pop!_OS)

Run the following then reboot.

```sh
sudo kernelstub -a "systemd.unified_cgroup_hierarchy=1"
```

### Enabling CPU, CPUSET, and I/O delegation

Enable as needed for minikube with rootless docker driver.

```sh
sudo mkdir -p /etc/systemd/system/user@.service.d
cat <<EOF | sudo tee /etc/systemd/system/user@.service.d/delegate.conf
[Service]
Delegate=cpu cpuset io memory pids
EOF
sudo systemctl daemon-reload
```

Ref:
- https://minikube.sigs.k8s.io/docs/start/
- https://minikube.sigs.k8s.io/docs/drivers/docker/
- https://rootlesscontaine.rs/getting-started/common/cgroup2/
- https://www.atken.dev/en/post/kind-rootless-kernelstub/

## Install asdf

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
source ~/.zshrc
```

Ref: https://asdf-vm.com/guide/getting-started.html

## Install Kubectl

```sh
asdf plugin-add kubectl
asdf install kubectl latest
asdf global kubectl $INSTALLED_VERSION
source ~/.zshrc
```

Ref: https://github.com/asdf-community/asdf-kubectl

## Install zsh-kubectl-prompt

```sh
git clone https://github.com/superbrothers/zsh-kubectl-prompt ~/zsh-kubectl-prompt
source ~/.zshrc
```

Ref: https://github.com/superbrothers/zsh-kubectl-prompt#usage


## Install Helm

```sh
asdf plugin-add helm
asdf install helm latest
asdf global helm $INSTALLED_VERSION
source ~/.zshrc
```

Enable completion.

```sh
helm completion zsh | sudo tee /usr/local/share/zsh/site-functions/_helm
source ~/.zshrc
```

Ref:
- https://github.com/Antiarchitect/asdf-helm
- https://helm.sh/docs/helm/helm_completion_zsh/

## Install Terraform

```sh
asdf plugin-add terraform
asdf install terraform latest
asdf global terraform $INSTALLED_VERSION
source ~/.zshrc
```

Ref: https://github.com/asdf-community/asdf-hashicorp

## Install Azure CLI

```sh
sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-get update
sudo apt-get install azure-cli
```

Enable completion.

```sh
curl -sLO 'https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion' 
source ~/.zshrc
```

Ref: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
