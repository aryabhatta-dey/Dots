# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/arya/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Configs added by me

alias icat="kitty +kitten icat"
# fzf
# sourcing the files as given in the fzf entry of arch wiki. https://wiki.archlinux.org/index.php/Fzf#zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# Dedicated fzf completion key. https://github.com/junegunn/fzf/wiki/Configuring-fuzzy-completion
export FZF_COMPLETION_TRIGGER=''
bindkey '^[[A' fzf-history-widget
bindkey '^[[B' fzf-completion
bindkey '^I' $fzf_default_completion
