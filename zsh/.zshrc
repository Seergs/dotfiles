# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias vim="nvim"
alias vimrc="nvim ~/.config/nvim/init.lua"
alias zshrc="nvim ~/.zshrc"

export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home
export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.15.jdk/Contents/Home

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

alias gce="git commit --allow-empty --message"

# source local zshrc
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# added by travis gem
[ ! -s /Users/sergiosuarez/.travis/travis.sh ] || source /Users/sergiosuarez/.travis/travis.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
