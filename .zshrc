export ZSH_DISABLE_COMPFIX="true"

alias enableautosuggestions='echo "export ZSH_AUTO_SUGGESTIONS=true" > ~/.zsh.auto.suggestion; echo "[SUCCESS] Please restart the terminal."'
alias disableautosuggestions='echo "export ZSH_AUTO_SUGGESTIONS=false" > ~/.zsh.auto.suggestion; echo "[SUCCESS] Please restart the terminal."'
alias disablecustomgit='echo "export CUSTOM_GIT_ENABLED=false" > ~/.custom-git.enabled; echo "[SUCCESS] Please restart the terminal."'
alias enablecustomgit='echo "export CUSTOM_GIT_ENABLED=true" > ~/.custom-git.enabled; echo "[SUCCESS] Please restart the terminal."'
alias enablecustomgitremote='enablecustomgit; echo "export CUSTOM_GIT_VALUE=remote" > ~/.custom-git.value; echo "[SUCCESS] Please restart the terminal."'
alias enablecustomgitprod='enablecustomgit; echo "export CUSTOM_GIT_VALUE=prod" > ~/.custom-git.value; echo "[SUCCESS] Please restart the terminal."'
alias enablecustomgitlocal='enablecustomgit; echo "export CUSTOM_GIT_VALUE=local" > ~/.custom-git.value; echo "[SUCCESS] Please restart the terminal."'
alias chtitle='echo -n -e "\033]0;$(basename ${PWD})\007"'

MOVE_UP=$(tput cuu 1)
CLEAR_LINE=$(tput el 1)
alias mucl='echo ${MOVE_UP}${CLEAR_LINE}${MOVE_UP}${MOVE_UP}'

source ~/.custom-git.enabled
source ~/.custom-git.value
source ~/.fzf-git.zsh
source ~/.swiggy.zsh

source ~/.zsh.auto.suggestion
source $HOME/Own_Repos/custom-cli/.aliases
source $HOME/Own_Repos/custom-cli/.kb_alias

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export __DEBUG_BASH=false
export GHPAToken=8b9c47102a245aec72c6ffbc9c64c558c5dab0c6    # github personal access token
export GHUSERNAME=bhavidhingra                               # github username

export GOBIN="$HOME/go/bin"

export PATH=$PATH:$HOME/Library/Python/3.7/bin/
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/Cellar/mongodb-community/4.4.3/bin
export PATH=$PATH:$GOBIN

#export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home'

#if type rg &> /dev/null; then
#    export FZF_DEFAULT_COMMAND='rg --files'
#fi

ssh-add &> /dev/null
ssh-add ~/.ssh/id_rsa_bhavidhingra &> /dev/null

# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
# Note: this may interfere with building old versions of Ruby (e.g <2.4) that use OpenSSL <1.1
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bhavi.dhingra1/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z docker zsh-interactive-cd)

# docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

if [[ $ZSH_AUTO_SUGGESTIONS == true ]]; then
    plugins=(zsh-autosuggestions)
fi

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
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /Users/bhavi.dhingra1/Library/Python/3.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

#source ~/.zplug/init.zsh

# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

# Then, source plugins and add commands to $PATH
#zplug load --verbose

# source /Users/bhavi.dhingra1/.config/broot/launcher/bash/br

echo -n -e "\033]0;$(basename ${PWD})\007"
# echo -n -e "\033]0;custom-git\007"

eval "$(zoxide init zsh)"

export PATH=$PATH:/opt/apache-maven/bin

export BAT_PAGER="less -rR"

#[ -f ~/.jumparound.sh ] && source ~/.jumparound.sh

# https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d#4cbe
export FZF_COMPLETION_TRIGGER='**'

if [[ "$CUSTOM_GIT_VALUE" == "local" ]]; then
    [ -f ~/Own_Repos/custom-git/init.zsh ] && source ~/Own_Repos/custom-git/init.zsh
elif [[ "$CUSTOM_GIT_VALUE" == "remote" ]]; then
    # [ -f ~/custom-git/custom-git-bash/init.zsh ] && source ~/custom-git/custom-git-bash/init.zsh
    [ -f ~/custom-git/cg-remote-init.zsh ] && source ~/custom-git/cg-remote-init.zsh
elif [[ "$CUSTOM_GIT_VALUE" == "prod" ]]; then
    [ -f ~/.custom-git/init.zsh ] && source ~/.custom-git/init.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
