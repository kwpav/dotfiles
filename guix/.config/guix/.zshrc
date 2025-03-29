# setup history file
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
# save each command's beginning timestamp and the duration to the history file
setopt extended_history

autoload -Uz compinit promptinit
compinit
promptinit

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob

# autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

prompt walters

# ssl setup for git, etc
# https://guix.gnu.org/manual/en/html_node/X_002e509-Certificates.html
# export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
# export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
# export GIT_SSL_CAINFO="$SSL_CERT_FILE"

alias gc='guix gc -d 7d'
alias sysreconfigure='sudo -E guix system reconfigure /home/kpav/.config/guix/system.scm'
alias homereconfigure="guix home reconfigure /home/kpav/.config/guix/home-config.scm"
alias lutris='flatpak run net.lutris.Lutris'
alias fsteam='flatpak run com.valvesoftware.Steam'
alias jellyfin='flatpak run org.jellyfin.JellyfinServer'
export PATH=/home/kpav/bin:$PATH
