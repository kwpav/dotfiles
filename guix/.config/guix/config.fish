abbr sysreconfigure "sudo -E guix system reconfigure /home/kpav/.config/guix/system.scm"
abbr homereconfigure "guix home reconfigure /home/kpav/.config/guix/home-config.scm"
abbr fsteam "flatpak run com.valvesoftware.Steam"
abbr ll "eza -ll"
abbr la "eza -la"

alias cat="bat"

# add ~/bin to PATH
# if status --is-login
#     set -gx PATH $PATH ~/bin
# end
fish_add_path ~/bin
