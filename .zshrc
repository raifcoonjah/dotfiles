#        _                             _                        __ _       
#   ___ | |__  _ __ ___  _   _ _______| |__     ___ ___  _ __  / _(_) __ _ 
#  / _ \| '_ \| '_ ` _ \| | | |_  / __| '_ \   / __/ _ \| '_ \| |_| |/ _` |
# | (_) | | | | | | | | | |_| |/ /\__ \ | | | | (_| (_) | | | |  _| | (_| |
#  \___/|_| |_|_| |_| |_|\__, /___|___/_| |_|  \___\___/|_| |_|_| |_|\__, |
#                        |___/                                       |___/ 
# RC \ 2023

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="aphrodite/aphrodite" # set by `omz`

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 15

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)

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

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dnf="dnf5"
alias makevm="vagrant up && vagrant ssh"
alias makevmd="vagrant destroy && vagrant up && vagrant ssh"
