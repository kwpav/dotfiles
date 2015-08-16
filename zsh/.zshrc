# ~/.zshrc

# load antigen
source ~/.zsh/antigen/antigen.zsh

# load aliases
source ~/.config/zsh/alias.zsh
source ~/.config/zsh/ssh.zsh

antigen use oh-my-zsh

# plugins
antigen bundle git
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found

# python plugins
antigen bundle python
#antigen bundle pip

# node plugins
#antigen bundle npm

# theme
antigen theme agnoster

antigen apply

# executable paths
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

## workaround for handling TERM variable in multiple tmux sessions properly from http://sourceforge.net/p/tmux/mailman/message/32751663/ by Nicholas Marriott
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
        case $(tmux showenv TERM 2>/dev/null) in
                *256color) ;&
                TERM=rxvt-unicode-256color)
                        TERM=screen-256color ;;
                *)
                        TERM=screen
        esac
fi
