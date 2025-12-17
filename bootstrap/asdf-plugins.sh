#!/usr/bin/env bash

set -e

function install_plugin() {
  asdf plugin-add ${1} ${2}
  asdf install ${1} ${3}
  local version=$(asdf list ${1} | tail -1 | tr -d ' *')
  asdf global ${1} ${version}
  return 0
}

if [ ! -d "${HOME}/.asdf" ]; then
  echo asdf is not installed. Skipped to install plugins.
  exit 0
fi

. "$HOME/.asdf/asdf.sh"

install_plugin "java" "https://github.com/halcyon/asdf-java.git" "adoptopenjdk-17.0.8+7"
install_plugin "kotlin" "" "latest"
install_plugin "python" "" "latest"
install_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git" "latest"
install_plugin "golang" "https://github.com/asdf-community/asdf-golang.git" "latest"
install_plugin "rust" "https://github.com/asdf-community/asdf-rust.git" "latest"
install_plugin "flutter" "" "latest"
install_plugin "deno" "https://github.com/asdf-community/asdf-deno.git"

install_plugin "pnpm" "https://github.com/asdf-community/asdf-pnpm.git" "latest"
install_plugin "gradle" "https://github.com/rfrancis/asdf-gradle.git" "latest"
install_plugin "maven" "https://github.com/halcyon/asdf-maven.git" "latest"

install_plugin "kubectl" "https://github.com/asdf-community/asdf-kubectl.git" "latest"
install_plugin "minikube" "https://github.com/alvarobp/asdf-minikube.git" "latest"
install_plugin "helm" "https://github.com/Antiarchitect/asdf-helm.git" "latest"

install_plugin "github-cli" "https://github.com/bartlomiejdanek/asdf-github-cli.git" "latest"
install_plugin "firebase" "" "latest"
install_plugin "awsci" "https://github.com/MetricMike/asdf-awscli.git" "latest"
install_plugin "gcloud" "https://github.com/jthegedus/asdf-gcloud" "latest"

install_plugin "terraform" "https://github.com/asdf-community/asdf-hashicorp.git" "latest"
install_plugin "pulumi" "https://github.com/canha/asdf-pulumi.git" "latest"

install_plugin "uv" "https://github.com/asdf-community/asdf-uv.git" "latest"

exit 0
