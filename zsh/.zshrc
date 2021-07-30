# dependencies
## phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
## nodebrew
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.anyenv/bin
export PATH=$PATH:$HOME/dotfiles2/node_modules/.bin

# load prompt
# autoload -U promptinit; promptinit
# prompt pure

# completion
autoload -Uz compinit; compinit

# list completion
setopt auto_list

# switch completion sequential
setopt auto_menu

# easy cd
setopt auto_cd

# history
export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

# usable another terminal history
setopt share_history

# custom aliases
alias ls='lsd'
alias ll='ls -la'

eval "$(starship init zsh)"
eval "$(anyenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"
