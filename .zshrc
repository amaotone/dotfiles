#------------------------------
# General Option
#------------------------------
ZSH_THEME='prompt'
export LANG=ja_JP.UTF-8
autoload -Uz colors
colors

setopt print_eight_bit
setopt interactive_comments
setopt auto_cd
setopt prompt_subst

#------------------------------
# History
#------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt share_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_save_no_dups

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

autoload -Uz smart-insert-last-word
zstyle :insert-last-word match '*([[:alpha:]/\]?|?[[:alpha:]/\])*'
zle -N insert-last-word smart-insert-last-word

#------------------------------
# Alias
#------------------------------
alias ll='ls -l'
alias la='ls -A'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias df='df -h'
alias ps='ps --sort=start_time'
alias mkdir='mkdir -p'
alias btc='ssh -i ~/.ssh/id_rsa.gcp amaotone@35.226.209.126'
alias c='g++ -std=c++14 -Wall -g -fsanitize=undefined -D_GLIBCXX_DEBUG'
alias fp='(){cat $1 | pbcopy}'
alias git='hub'
alias zshrc='vi ~/.zshrc'
alias sant='cd ~/dev/kaggle/santander_value'
alias od='rm -rf test;oj d'
alias ru='rm -f a.out;rustc -o a.out $1'
function rut(){
    rm -f a.out
    rustc $1 -o a.out || return 1
    oj t -i -c ./a.out
}

#------------------------------
# Completion
#------------------------------
autoload -Uz compinit
compinit

#------------------------------
# Prompt
#------------------------------
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

#------------------------------
# pyenv
#------------------------------
if type pyenv > /dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

#------------------------------
# Plugin
#------------------------------
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

eval "$(rbenv init -)"

#-----------------------------
# Google Cloud Platform
#-----------------------------
export PATH="$PATH:/Users/amane/Downloads/google-cloud-sdk/path.zsh.inc"
export PATH="$PATH:/Users/amane/Downloads/google-cloud-sdk/completion.zsh.inc"
export CLOUDSDK_PYTHON=$(which python2)

# Golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/dev/atcoder

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/amane/Downloads/gcloud-sdk/path.zsh.inc' ]; then source '/Users/amane/Downloads/gcloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/amane/Downloads/gcloud-sdk/completion.zsh.inc' ]; then source '/Users/amane/Downloads/gcloud-sdk/completion.zsh.inc'; fi

export PYTHONPATH="$PYTHONPATH:$HOME/dev/kaggle/spica"
kaggle_python(){
    docker run -v $PWD:/tmp/working -w=/tmp/working --rm -it kaggle/python python "$@"  
}
kaggle_jupyter() {
    docker run -v $PWD:/tmp/working -w=/tmp/working -p 8888:8888 --rm -it kaggle/python jupyter notebook --no-browser --ip="0.0.0.0" --notebook-dir=/tmp/working --allow-root
}

