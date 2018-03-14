export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=~/.oh-my-zsh

ZSH_THEME="afowler"

plugins=(
  git tmux nvm mercurial
)

source $ZSH/oh-my-zsh.sh

# configuration
export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias t="task"
alias mutt="neomutt"
alias ra="ranger"
alias gs="git status"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh