# export TERM=xterm-256color-italic
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.npm-packages/bin:/usr/local/share/npm/bin:$PATH
export PATH=~/bin:$PATH

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

if [ -d `brew --prefix`/share/zsh-completions ]; then
    fpath=(`brew --prefix`/share/zsh-completions $fpath)
fi

#if [ -f `brew --prefix`zsh/site-functions/git-flow-completion.zsh ]; then
#    source `brew --prefix`zsh/site-functions/git-flow-completion.zsh
#fi

if [ -f `brew --prefix`/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source `brew --prefix`/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f `brew --prefix`/opt/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    source `brew --prefix`/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
    # bind k and j for VI mode
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt shwordsplit
setopt PROMPT_SUBST
autoload -U promptinit && promptinit
autoload -U colors && colors

if [ -f `brew --prefix`/etc/profile.d/colorsvn-env.sh ]; then
    source `brew --prefix`/etc/profile.d/colorsvn-env.sh
fi

export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_SHOWCOLORHINTS=true

export ACKRC=".ackrc"
export EDITOR=vim

# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

source $HOME/.zsh_prompt
source $HOME/.alias

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function newproject() { curl https://raw.github.com/nhhagen/vagrant-dev-box/master/setup.sh | bash -s $@ ; }
