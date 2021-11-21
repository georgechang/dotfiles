# register brew path
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# init starship
eval $(starship init zsh)

# init keychain
eval $(keychain --eval --quiet --agents ssh id_rsa)

# init znap
source ~/.znap/zsh-snap/znap.zsh
znap source zsh-users/zsh-autosuggestions
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting
znap source ohmyzsh/ohmyzsh 'lib/history.zsh' plugins/history

# aliases
alias ls="ls --color=auto"

# homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# az completions
source /etc/bash_completion.d/azure-cli

# flux completions
command -v flux >/dev/null && . <(flux completion zsh)

# dotnet completions
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}
compctl -K _dotnet_zsh_complete dotnet

# fzf init
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tty
export GPG_TTY=$(tty)