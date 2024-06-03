;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells)
             (gnu home services ssh))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages (specifications->packages (list
                                       ;; programming
                                       "guile"
                                       "openjdk:jdk"
                                       "clojure"
                                       "clojure-tools"
                                       "babashka"
                                       "python"
                                       ;; desktop
                                       "papirus-icon-theme"
                                       "emacs-next-pgtk"
                                       ;; "firefox-wayland"
                                       "firefox"
                                       "alacritty"
                                       "foot"
                                       "geekbench5"
                                       ;; "deluge"
                                       "ungoogled-chromium"
                                       "qbittorrent"
                                       ;; tools
                                       "curl"
                                       "mesa-utils"
                                       "mangohud"
                                       "pulsemixer"
                                       "gnome-tweaks"
                                       "ripgrep"
                                       "lm-sensors"
                                       "bpytop"
                                       "htop"
                                       "flatpak"
                                       "make"
                                       "cmake"
                                       "libvterm"
                                       "nix"
                                       "zip"
                                       "unzip"
                                       ;; fonts
                                       "font-recursive"
                                       "font-awesome"
                                       "font-google-material-design-icons"
                                       "font-openmoji"
                                       "git"
                                       "tmux"
                                       "openssh-sans-x"
                                       ;; wm tools
                                       "fuzzel"
                                       "waybar-experimental"
                                       "swaybg")))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (list (service
          home-zsh-service-type
          (home-zsh-configuration
           (zshrc (list (local-file "/home/kpav/.config/guix/.zshrc"
                                    "zshrc"))))
          ;; home-bash-service-type
          ;;         (home-bash-configuration
          ;;          (aliases '(("sys-reconfigure" . "sudo -E guix system reconfigure /home/kpav/.config/guix/system.scm")
          ;;                     ("home-reconfigure" . "guix home reconfigure /home/.config/guix/home-config.scm")
          ;;                     ("lutris" . "flatpak run net.lutris.Lutris")
          ;;                     ("steam" . "flatpak run com.valvesoftware.Steam")))
          ;;          (bashrc (list (local-file
          ;;                         "/home/kpav/.config/guix/.bashrc"
          ;;                         "bashrc")))
          ;;          (bash-profile (list (local-file
          ;;                               "/home/kpav/.config/guix/.bash_profile"
          ;;                               "bash_profile"))))
                  )
         (service home-openssh-service-type
                  (home-openssh-configuration
                   (hosts
                    (list (openssh-host (name "github.com")
                                        (identity-file "~/.ssh/gh_ed25519"))
                          (openssh-host (name "*sr.ht")
                                        (identity-file  "~/.ssh/srht_ed25519"))))
                   (add-keys-to-agent "yes")))
         ;; TODO look into home-gpg-agent-service-type
         (service home-ssh-agent-service-type))))
