# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

## Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"

## Load and initialise completion system
autoload -Uz compinit
compinit


# Keybindings
# Ctrl + F to complete suggestions or go forward
# Ctrl + B to go backward
# Ctrl + P to see previous history
# Ctrl + N to see next history
bindkey -e


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# Aliases
alias grep='grep --color=auto'
alias ls="exa -l --icons"
alias cat="bat"
alias vim="nvim"


# Paths
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
export EDITOR=nvim


# Tools setup
## starship
eval "$(starship init zsh)"

## fnm
export PATH="/home/binamra/.local/share/fnm:$PATH"
eval "`fnm env`"

## zoxide
eval "$(zoxide init zsh)"

## bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# bun completions
[ -s "/home/binamra/.bun/_bun" ] && source "/home/binamra/.bun/_bun"

eval "$(atuin init zsh)"

# if [ -z "$TMUX" ]
# then
#    tmux attach -t Main || tmux new -s Main
# fi
#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/binamra/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/binamra/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/binamra/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/binamra/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

