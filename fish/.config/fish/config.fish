if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval $(minikube docker-env)
source $HOME/.cargo/env
