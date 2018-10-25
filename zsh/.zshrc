HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# save each command's beginning timestamp and the duration to the history file
setopt extended_history

zstyle :compinstall filename '/home/kevin/.zshrc'

# autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob

# display PID when suspending processes as well
setopt longlistjobs

# If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts. Substitutions within prompts do not affect the command status.
setopt prompt_subst

autoload -Uz compinit promptinit vcs_info
compinit
promptinit

# from https://stackoverflow.com/a/12935606
# mimics git status -s
# first M is staged
# second M is unstaged
# question marks are untracked
zstyle ':vcs_info:*' stagedstr 'M' 
zstyle ':vcs_info:*' unstagedstr 'M' 
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{4}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}[%F{4}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git 
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='%F{1}??%f'
fi
}

precmd() {
    vcs_info
}

# from robbyrussel
# show a green error if the exit code is 0, otherwise show a red arrow
ret_status="%(?:%F{green}➜%f:%F{red}➜%f)"

PROMPT='${ret_status} %B%F{cyan}%6~%f%b > '
#RPROMPT='[%F{yellow}%?%f]'
#RPROMPT="%B%T%b $(curtime) $(vcs_info_wrapper)"
RPROMPT='${vcs_info_msg_0_}'

zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select

alias sx='ssh-agent startx'

export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.node_modules/bin:$(ruby -e 'print Gem.user_dir')/bin:$home/composer/vendor/bin:$PATH"
export npm_config_prefix=~/.node_modules

# autosuggestions
# installed with pacman
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
# installed with pacman
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history search
# installed with pacman
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# fix delete key
bindkey "^[[3~" delete-char

if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
        case $(tmux showenv TERM 2>/dev/null) in
                *256color) ;&
                TERM=rxvt-unicode-256color)
                        TERM=screen-256color ;;
                *)
                        TERM=screen
        esac
fi
