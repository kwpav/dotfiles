
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

export PATH="$HOME/bin:/usr/local/bin:$HOME/.node_modules/bin:$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export npm_config_prefix=~/.node_modules

# export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

#Setting the GEM_PATH and GEM_HOME variables may not be necessary, check 'gem env' output to verify whether both variables already exist

# GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
# GEM_PATH=$GEM_HOME
# export PATH=$PATH:$GEM_HOME/bin

export EDITOR=emc

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

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
export GPG_TTY=$(tty)
