#!/usr/bin/env bash

set -e

function install_plugin() {
  asdf plugin-add ${1} ${2} && asdf install ${1} ${3} && asdf global ${1} ${3}
  return 0
}

if [ ! -d "${HOME}/.asdf" ]; then
  echo asdf is not installed. Skipped to install plugins.
  exit 0
fi

. "$HOME/.asdf/asdf.sh"

install_plugin "java" "https://github.com/halcyon/asdf-java.git" "adoptopenjdk-17.0.8+7"
install_plugin "python" "" "latest"
install_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git" "latest"
install_plugin "golang" "https://github.com/asdf-community/asdf-golang.git" "latest"
install_plugin "rust" "https://github.com/asdf-community/asdf-rust.git" "latest"
install_plugin "flutter" "" "latest"

install_plugin "gradle" "https://github.com/rfrancis/asdf-gradle.git" "latest"
install_plugin "maven" "https://github.com/halcyon/asdf-maven.git" "latest"

install_plugin "kubectl" "https://github.com/asdf-community/asdf-kubectl.git" "latest"
install_plugin "minikube" "https://github.com/alvarobp/asdf-minikube.git" "latest"
install_plugin "helm" "https://github.com/Antiarchitect/asdf-helm.git" "latest"

install_plugin "github-cli" "https://github.com/bartlomiejdanek/asdf-github-cli.git" "latest"

install_plugin "awsci" "https://github.com/MetricMike/asdf-awscli.git" "latest"
install_plugin "azure-cli" "https://github.com/EcoMind/asdf-azure-cli" "latest"

install_plugin "terraform" "https://github.com/asdf-community/asdf-hashicorp.git" "latest"
install_plugin "pulumi" "https://github.com/canha/asdf-pulumi.git" "latest"

exit 0
