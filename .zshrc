# Enabling Powerlevel10k instant prompt
# Code that require user input like passwords or yes/no confirmation must go above this
# Everything else goes below
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Prompt plugin. git:https://github.com/romkatv/powerlevel10k
source ~/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Sourcing zsh-defer to do stage zsh loading. git:https://github.com/romkatv/zsh-defer#installation
source ~/zsh-plugins/zsh-defer/zsh-defer.plugin.zsh

# History
HISTFILE=~/.histfile
# Maximum number of lines to save in the history file
SAVEHIST=10000
# Maximum number of lines to save in a session
HISTSIZE=10000

# Use vi mode
bindkey -v

# Do not beep
setopt nobeep

# Automatically cd by only typing the path
setopt autocd

# For kitty
alias icat="kitty +kitten icat"

# Syntax highlighting plugin. git:https://github.com/zsh-users/zsh-syntax-highlighting
zsh-defer source ~/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# fzf needs to be sourced before zsh-autocomplete. https://github.com/marlonrichert/zsh-autocomplete/issues/4
# Sourcing fzf as given in Arch Wiki. https://wiki.archlinux.org/index.php/Fzf#zsh
zsh-defer source /usr/share/fzf/key-bindings.zsh
zsh-defer source /usr/share/fzf/completion.zsh
# Use <c-t> to start context aware fzf completion. https://github.com/junegunn/fzf/wiki/Configuring-fuzzy-completion
zsh-defer export FZF_COMPLETION_TRIGGER=''
zsh-defer bindkey '^T' fzf-completion
zsh-defer bindkey '^I' $fzf_default_completion
# Use <c-r> to start fuzzy search history
# Use <alt-c> to change directories 

# Autocompletion plugin. git:https://github.com/marlonrichert/zsh-autocomplete
zsh-defer source ~/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Wait for a minimum of 3 characters to input
zstyle ':autocomplete:list-choices:*' min-input 3
# Use <tab> and <s-tab> to select completions
zstyle ':autocomplete:tab:*' completion select
# Use <tab> and <s-tab> to insert a common substring
zstyle ':autocomplete:tab:*' completion insert
# Use <tab> and <s-tab> to cycle between completions
zstyle ':autocomplete:tab:*' completion cycle

# Async plugin. git:https://github.com/mafredri/zsh-async.git
zsh-defer source ~/zsh-plugins/zsh-async/async.plugin.zsh
