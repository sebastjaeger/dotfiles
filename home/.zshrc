# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mytheme"
if [[ ! -a ~/.oh-my-zsh/themes/$ZSH_THEME.zsh-theme ]]; then
    ZSH_THEME="robbyrussell"
fi

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
#plugins=(zsh-syntax-highlighting git)
plugins=(git zsh-completions zsh-syntax-highlighting history-substring-search zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
HISTFILE=$HOME/.zhistory
HISTSIZE=500000
SAVEHIST=500000

alias ltr="ls -ltr"

alias vundle-install="vim +PluginInstall +qall"
alias vundle-update="vim +PluginInstall! +qall"
alias vundle-clean="vim +PluginClean! +qall"

alias deact="deactivate"
alias tmux="TERM=xterm-256color /usr/bin/tmux"

export PYTHONPATH=${HOME}/lib:
export PATH=$HOME/bin:/usr/local/bin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

#bindkey "$terminfo[kcuu1]" history-beginning-search-backward
#bindkey "$terminfo[kcud1]" history-beginning-search-forward

DFILE=$HOME/.dbs
if [[ -a $DFILE ]]; then
    source $DFILE
fi

AFILE=$HOME/.profile
if [[ -a $AFILE ]]; then
    source $AFILE
fi

# Load zsh-syntax-highlighting.
#source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-history-substring-search
#source ~/.oh-my-zsh/custom/p lugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Load zsh-autosuggestions.
#source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/autosuggestions.zsh
AUTOSUGGESTION_HIGHLIGHT_COLOR="fg=4"

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# Accept suggestions without leaving insert mode
bindkey '^f' vi-end-of-line

eval `dircolors ~/.dircolors/dircolors.256dark`

autoload -U compinit && compinit

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
