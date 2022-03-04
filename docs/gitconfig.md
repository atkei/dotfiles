# Gitconfig

## Add .gitconfig for each git server

These are included by [`.gitconfig`](../.gitconfig).  

```
[includeIf "gitdir:~/github/atken/"]
  path = ~/github/atken/.gitconfig

[includeIf "gitdir:~/gitlab/work/"]
  path = ~/gitlab/work/.gitconfig
```

Separate directories to manage repositories for each git server.  
For example, to use different names and emails for private and work use.
