export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=~/.oh-my-zsh

ZSH_THEME="afowler"

plugins=(
  git nvm
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

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > ~/.ssh-agent-id
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
  eval "$(<~/.ssh-agent-id)"
fi

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

alias glGraph='git log --color=always --graph --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
local _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
local _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# fcoc - checkout git commit with previews
fcoc() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
      --ansi --preview $_viewGitLogLine ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow - git commit browser with previews
fshow() {
  glGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
      --ansi --preview $_viewGitLogLine \
      --header "enter to view, alt-y to copy hash" \
      --bind "enter:execute:$_viewGitLogLine   | less -R" \
      --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
