# General Option
ZSH_THEME='prompt'
export LANG=ja_JP.UTF-8
autoload -Uz colors
colors

setopt print_eight_bit
setopt interactive_comments
setopt auto_cd
setopt hist_ignore_space
setopt share_history
setopt prompt_subst

# Alias
alias ll='ls -l'
alias la='ls -A'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# Completion
autoload -Uz compinit
compinit

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Prompt
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# VCS
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# pyenv
if type pyenv > /dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Plugin
if [ -e "${HOME}/.zplug" ]; then
	source ~/.zplug/init.zsh

	zplug "b4b4r07/enhancd", use:enhancd.sh
	zplug "zsh-users/zsh-autosuggestions"
	zplug "zsh-users/zsh-completions"
	zplug "zsh-users/zsh-history-substring-search"
	zplug "zsh-users/zsh-syntax-highlighting", defer:2

	if ! zplug check; then
		zplug install 
	fi
	zplug load 
fi

