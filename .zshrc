# Antigen
ANTIGEN_VERSION=2.2.2
source /usr/local/Cellar/antigen/$ANTIGEN_VERSION/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  git
  npm
  osx
  tylerreckart/hyperzsh
EOBUNDLES

antigen apply

# Always highlight grep matches
GREP_OPTIONS="--color=always"; export GREP_OPTIONS

# Prevent overwriting of existing files with > output redirection operator
set noclobber

# General aliases
alias Ls="ls -aF" # Show all files and distinguishes between files, directories, executables (*) and symlinks (@)
alias Ps="/bin/ps -ax" # Show all processes from all users including processes not connected to a Terminal session
alias top="/usr/bin/top -s 5 -o cpu" # Sort processes by CPU usage and update it every 5 seconds
alias python="python3" # Always use Python 3 instead of Python 2
alias ghci="stack exec -- ghci"
alias ghc="stack exec -- ghc"
alias psci="pulp repl"
alias psc="psc-package"
alias buc="brew upgrade --cleanup"
alias flow="nocorrect flow"
alias ghci-core="ghci -ddump-simpl -dsuppress-idinfo \
-dsuppress-coercions -dsuppress-type-applications \
-dsuppress-uniques -dsuppress-module-prefixes"

# Git aliases
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitd="git push"
alias gitf="git fetch"
alias gitz="git pull"
alias gito="git checkout"
alias gitrao="git remote add origin"
alias gitb="git checkout -b"

# yarn aliases
alias ya="yarn add"
alias yad="yarn add -d"
alias yrb="yarn run build"

# Directory shortcuts
alias docs="cd ~/Documents"
alias github="cd ~/Documents/GitHub"
alias mvim="open -a MacVim"

# Stack auto-completions
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" # Basic setup
PATH="$PATH:$HOME/.cargo/bin"                       # Rust
PATH="$PATH:$HOME/.rvm/bin"                         # Ruby
PATH="/Users/ssyrek/.local/bin:$PATH"

# Node
export NODE_ENV='development'
PATH="$HOME/.npm/bin:$PATH"
PATH="./node_modules/.bin:./bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Path to your oh-my-zsh installation.
export ZSH="/Users/ssyrek/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="hyperzsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git npm osx)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR="vim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Path

export PATH

eval $(thefuck --alias)
