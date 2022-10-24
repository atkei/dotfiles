# Kubernetes

## Prerequisite

- [Docker](./docker.md)
  - Rootless Docker (Optional)

## Install minikube

https://minikube.sigs.k8s.io/docs/start/

## Enable minikube completion

https://minikube.sigs.k8s.io/docs/commands/completion/

```sh
minikube completion zsh | sudo tee /usr/local/share/zsh/site-functions/_minikube
```

## Install kind

https://kind.sigs.k8s.io/docs/user/quick-start/#installation

## Enable kind on Rootless Docker

https://kind.sigs.k8s.io/docs/user/rootless/

If using [kurnelstub](https://github.com/isantop/kernelstub), the procedure to enable cgroup v2 is different.  
https://www.atken.dev/en/post/kind-rootless-kernelstub/

## Install kubectl

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

Install a version that is compatible with the operating clusters.
