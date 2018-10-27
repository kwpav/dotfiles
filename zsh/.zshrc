HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# save each command's beginning timestamp and the duration to the history file
setopt extended_history

zstyle :compinstall filename '/home/kevin/.zshrc'

# display PID when suspending processes as well
setopt longlistjobs

autoload -Uz compinit
compinit

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob

# autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle -e ':completion:*:approximate:*' \
max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:functions' ignored-patterns '_*'

xdvi() { command xdvi ${*:-*.dvi(om[1])} }

zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

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

autoload -Uz promptinit vcs_info
promptinit

# If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts. Substitutions within prompts do not affect the command status.
setopt prompt_subst

zstyle ':vcs_info:*' stagedstr '●'
zstyle ':vcs_info:*' unstagedstr '●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{4}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{8}[%F{7}±%B%b%%b %F{2}%c%F{3}%u%F{8}]%f' # %%b is bold off
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git 
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='%F{1}●%f'
fi
}

precmd() {
    vcs_info
}

# from robbyrussel
# show a green error if the exit code is 0, otherwise show a red arrow
ret_status="%(?:%F{green}λ%f:%F{red}λ%f)"
newline=$'\n'

PROMPT='${newline}%B%F{cyan}%6~%f ${ret_status}%b '
RPROMPT='${vcs_info_msg_0_}'

alias pac='sudo pacman'
alias pacs='pac -S'
alias pacu='pac -Syu'
alias pacy='pac -Sy'
alias pacss='pac -Ss'
alias pacq='pac -Qs'

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
