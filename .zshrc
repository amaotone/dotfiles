#------------------------------
# Alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -AG'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='nvim' alias vim='nvim' alias vv='nvim ~/.vimrc' alias vz='nvim ~/.zshrc' alias vt='nvim ~/.tmux.conf'
alias vp='nvim ~/.config/nvim/dein.toml'
alias vpl='nvim ~/.config/nvim/dein_lazy.toml'
alias grep='grep --color'
alias df='df -h'
alias ps='ps --sort=start_time'
alias mkdir='mkdir -p'
alias c='g++ -std=c++14 -Wall -g -fsanitize=undefined -D_GLIBCXX_DEBUG'
alias git='hub'
alias git_private='git config --local user.name "amaotone"; git config --local user.email "amane.suzu@gmail.com"'
alias git_dena='git config --local user.name "Amane Suzuki"; git config --local user.email "amane.suzuki@dena.com"'

# ----------------------------
# path
export LANG=ja_JP.UTF-8

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ----------------------------
# env

direnv() {
  unfunction "$0"
  source <(direnv hook zsh)
  $0 "$@"
}

# ----------------------------
# zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light momo-lab/zsh-abbrev-alias
zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light agkozak/zsh-z
zinit light mollifier/anyframe
zinit light zsh-users/zsh-history-substring-search
zinit light supercrabtree/k
zinit light gimbo/iterm2-tabs.zsh
zinit light paulirish/git-open

# ----------------------------
# anyframe
bindkey '^r' anyframe-widget-execute-history
bindkey '^g' anyframe-widget-cd-ghq-repository

eval "$(starship init zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
