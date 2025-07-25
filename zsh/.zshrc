export ZSH="$HOME/.oh-my-zsh"

plugins=(git z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

NOTES_DIR="$HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/notes"

alias v="nvim"
alias vim="nvim"
alias vimrc="nvim ~/.config/nvim/init.lua"
alias zshrc="nvim ~/.zshrc"
alias notes="cd $NOTES_DIR && nvim ."
export EDITOR=nvim
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home
export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.15.jdk/Contents/Home
export JAVA_17_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
export JAVA_21_HOME=/Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'
alias java21='export JAVA_HOME=$JAVA_21_HOME'

# source local zshrc
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/sergiosuarez/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# Avoid running these commands when inside an IntelliJ environment
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ] && [ -z "$VSCODE_IPC_HOOK_CLI" ]; then

    # Run tmux at startup
    if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      tmux new-session -A -s main
    fi
fi

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

set -o vi

# Shell integrations
eval "$(fzf --zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
