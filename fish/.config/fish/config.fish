if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval $(minikube docker-env)
source $HOME/.cargo/env

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/sergiosuarez/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
