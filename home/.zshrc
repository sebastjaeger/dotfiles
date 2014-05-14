# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Install oh-my-zsh if not installed already
#if ! [[ -d $ZSH ]]; then
    #git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
#fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mytheme"

# Zsh history
HISTFILE=$HOME/.zhistory
HISTSIZE=500000
SAVEHIST=500000

# Example aliases
AFILE=$HOME/.zsh-aliases
if [[ -a $AFILE ]]; then
    source $AFILE
fi
alias vundle="vim +PluginInstall +qall"
alias vundle-update="vim +PluginInstall! +qall"
alias vundle-clean="vim +PluginClean! +qall"

alias mvd="cd ~/mv_mongo; RESTLET_PORT=8089 ./sincerity start restlet"

alias act=". ./.virtualenv/bin/activate"
alias deact="deactivate"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
#HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PYTHONPATH=${HOME}/lib:
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Make sure Vundle is installed
VIMP=$HOME/.vim
if ! [[ -d $VIMP ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git $VIMP/bundle/Vundle.vim
    vundle
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# History search
#bindkey '\e[A' history-beginning-search-backward
#bindkey '^[OA' history-beginning-search-backward
#bindkey '\e[B' history-beginning-search-forward
#bindkey '^[OB' history-beginning-search-forward

#zmodload zsh/terminfo
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey "$terminfo[kcuu1]" history-beginning-search-backward
bindkey "$terminfo[kcud1]" history-beginning-search-forward

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
