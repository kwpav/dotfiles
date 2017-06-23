
source ~/.zsh/antigen/antigen.zsh

source ~/.config/zsh/alias.zsh
source ~/.config/zsh/ssh.zsh

antigen use oh-my-zsh

antigen bundle git
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found

antigen bundle python

# theme
#antigen theme agnoster
antigen theme bureau

antigen apply

export PATH=$HOME/bin:/usr/local/bin:$PATH

export EDITOR=emc

if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
        case $(tmux showenv TERM 2>/dev/null) in
                *256color) ;&
                TERM=rxvt-unicode-256color)
                        TERM=screen-256color ;;
                *)
                        TERM=screen
        esac
fi

command fortune

export NVM_DIR="/home/kevin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
