# Path to your oh-my-zsh installation.
export ZSH=/Users/victor/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR="nvim"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# zsh plugins
plugins=(git common-aliases osx sbt sublime wd)

# Env vars

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export MYZSHRC="$HOME/.zshrc"

# fzf (fuzzy finding)
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168"

export HISTTIMEFORMAT="%d/%m/%y %T "

################ Start services and tools

# Ruby configuration
eval "$(rbenv init -)"

# NPM/nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Allows tmux -CC
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Starts z (smart autocomplete)
. /usr/local/etc/profile.d/z.sh

# Starts fzf (fuzzy-finding)
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable fuck
eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/Users/victor/Downloads/google-cloud-sdk/path.zsh.inc" ]; then source "/Users/victor/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "/Users/victor/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then source "/Users/victor/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

################ Aliases and helpers
alias n="nvim"

alias ll='ls -lAht'

alias marvin-ssh="ssh marvin@marvin-dev.mfglabs.com -R 9014:localhost:9014"
alias gco="git checkout"
alias xa="exa -abghl --git --color=automatic"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

alias did="nvim +'normal Go' +'r!date' ~/.did/did.txt"

function killport {
  kill -3 $(lsof -i:$1 | grep TCP | awk "{print $2;}")
}

function killgrep {
  local pids=$(ps aux | grep $1 | grep -v 'grep --color' | awk '{print $2}')
  while read -r line; do
    kill -9 "$line"
  done <<< "$pids"
}

function swap() {
  mv $1 $1.swp
  mv $2 $1
  mv $1.swp $2
}

function locof() {
  z -l $1 | awk "{print $2}" | head -n1
}

function gcssh() {
  ssh victor.viale@$(gcloud compute instances list | grep $1 | awk '{print $4}' | head -n1)
}

function nufeature {
  exists=$(git show-ref feature/$1)
  if [ -n "$exists" ]; then
      echo "Branch $1 already exists!"
      return 1
  fi

  if [[ $(git status -uno --porcelain) ]]; then
    echo "Commit or stash changes first !"
    return 1
  fi

  git fetch origin
  git checkout develop

  if [[ $(git status -uno --porcelain) ]]; then
    echo "develop has changes, merge/rebase onto dev"
    return 1
  fi

  git pull origin develop
  git checkout -b feature/$1
}

function endfeature {
  if [ -z $(git status -uno --porcelain) ]; then
    branch=$(git rev-parse --abbrev-ref HEAD)
    if [ $(echo $branch | cut -c 1-8) -ne "feature/" ]
    then
      echo "Current branch ($branch) is not a feature"
      exit 1
    fi
    git push origin $branch
    sleep 1
    git checkout develop
    git pull origin develop
    directory=${PWD##*/}
    open https://git.mfglabs.com/CFI/oui/compare/develop...$branch
  else
    echo "branch is not clean";
  fi
}

function initGitHiddenFolder {
  local git_root=$(git rev-parse --show-toplevel)

  if [ -z $git_root ]
  then
    echo "No git repository found for the current directory"
    exit 1
  fi

  mkdir -p "$git_root/local"
  echo "/local" >> $git_root/.git/info/exclude
}

alias run-pg-docker="docker run --name local-postgres -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data mdillon/postgis:10"
