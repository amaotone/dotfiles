if [ -e "${HOME}/.zplug" ]; then
	source ~/.zplug/init.zsh
	zplug "zsh-users/zsh-completions"
	zplug "b4b4r07/enhancd", use:enhancd.sh
	zplug "zsh-users/zsh-syntax-highlighting", nice:10
	zplug "zsh-users/zsh-autosuggestions"
	zplug "zsh-users/zsh-completions"
	zplug "zsh-users/zsh-history-substring-search"

	if ! zplug check; then
		zplug install 
	fi
	zplug load --verbose
fi

export LANG=ja_JP.UTF-8
autoload -Uz colors
colors

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Prompt
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# Completion
autoload -Uz compinit
compinit

setopt print_eight_bit
setopt interactive_comments
setopt auto_cd
setopt hist_ignore_space
setopt share_history

# pyenv
if type pyenv > /dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
