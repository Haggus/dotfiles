export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=~/.oh-my-zsh

ZSH_THEME="afowler"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > ~/.ssh-agent-id
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
  eval "$(<~/.ssh-agent-id)"
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# git commit browser with previews
alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always %'"

gnn() {
  glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
      --ansi --preview="$_viewGitLogLine" \
        --header "Press Enter to view, ALT-Y to copy hash" \
        --bind "enter:execute:$_viewGitLogLine   | less -R" \
        --bind "alt-y:execute:$_gitLogLineToHash | xclip -sel clip"
}

# aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias ra="ranger"
alias gs="git status"
alias t="task"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
