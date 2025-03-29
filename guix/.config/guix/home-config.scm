;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu)
             (gnu packages)
             (gnu services)
             ;; (gnu packages base)
             (nongnu packages clojure)
             (nongnu packages game-client)
             (nongnu packages mozilla)
             (saayix packages wm)
             (guix gexp)
             (gnu home services shells)
             (gnu home services ssh))

(use-service-modules guix)

(use-package-modules
 base
 linux
 librewolf
 image-viewers
 java
 clojure
 rust
 zig
 curl
 commencement
 gl
 graphics
 pulseaudio
 gnome
 gnome-xyz
 terminals
 bittorrent
 rust-apps
 package-management
 emacs
 cmake
 admin
 virtualization
 compression
 fonts
 version-control
 tmux
 ssh
 xdisorg
 wm
 xfce
 python
 )

(home-environment
 ;; Below is the list of packages that will show up in your
 ;; Home profile, under ~/.guix-home/profile.
 ;; TODO dont use specifications->packages!!!
 (packages
  (list
   ;; programming languages
   ;; guile
   (list openjdk "jdk")
   clojure
   clojure-lsp
   clojure-tools
   ;; babashka is missing libs?
   babashka
   python
   rust
   rust-cargo
   zig
   gcc-toolchain
   gnu-make
   cmake
   libvterm
   ;; desktop apps
   ;; gnome-tweaks
   ;; emacs
   emacs-no-x-toolkit
   eww
   imv
   librewolf
   firefox
   fuzzel
   wofi
   foot
   qbittorrent
   thunar
   waybar-experimental
   swaybg
   steam
   ;; fonts & icons
   papirus-icon-theme
   font-recursive
   font-awesome
   ;; package managers
   flatpak
   nix
   ;; utils
   sysstat
   bat
   eza
   fd
   fzf
   wlr-randr
   curl
   git
   mesa-utils
   mangohud
   pulsemixer
   ;; pipewire
   ripgrep
   lm-sensors
   htop
   qemu
   zip
   unzip
   tmux
   openssh-sans-x)
  ;; (specifications->packages (list
  ;;                            ;; programming
  ;;                            "guile"
  ;;                            "openjdk:jdk"
  ;;                            "clojure"
  ;;                            "clojure-tools"
  ;;                            "babashka"
  ;;                            "python"
  ;;                            "gcc-toolchain"
  ;;                            ;; desktop
  ;;                            "papirus-icon-theme"
  ;;                            ;; "emacs-next-pgtk"
  ;;                            "emacs"
  ;;                            ;; "firefox-wayland"
  ;;                            "firefox"
  ;;                            "alacritty"
  ;;                            "foot"
  ;;                            "geekbench5"
  ;;                            ;; "deluge"
  ;;                            "ungoogled-chromium"
  ;;                            "qbittorrent"
  ;;                            ;; tools
  ;;                            "curl"
  ;;                            "mesa-utils"
  ;;                            "mangohud"
  ;;                            "pulsemixer"
  ;;                            "gnome-tweaks"
  ;;                            "ripgrep"
  ;;                            "lm-sensors"
  ;;                            "bpytop"
  ;;                            "htop"
  ;;                            "flatpak"
  ;;                            "make"
  ;;                            "cmake"
  ;;                            "libvterm"
  ;;                            "nix"
  ;;                            "qemu"
  ;;                            "zip"
  ;;                            "unzip"
  ;;                            ;; fonts
  ;;                            "font-recursive"
  ;;                            "font-awesome"
  ;;                            "font-google-material-design-icons"
  ;;                            "font-openmoji"
  ;;                            "git"
  ;;                            "tmux"
  ;;                            "openssh-sans-x"
  ;;                            ;; wm tools
  ;;                            "fuzzel"
  ;;                            "waybar-experimental"
  ;;                            "swaybg"))
  )

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
        ;; https://git.savannah.gnu.org/cgit/guix.git/tree/gnu/home/services/shells.scm?id=master#n595
        (service
         home-fish-service-type
         (home-fish-configuration
          (config (list (local-file "/home/kpav/.config/guix/config.fish")))
          )
         )
        (service home-openssh-service-type
                 (home-openssh-configuration
                  (hosts
                   (list (openssh-host (name "github.com")
                                       (identity-file "~/.ssh/gh_ed25519"))
                         (openssh-host (name "*sr.ht")
                                       (identity-file  "~/.ssh/srht_ed25519"))))
                  (add-keys-to-agent "yes")))
        ;; TODO this needs dbus?
        ;; (service home-pipewire-service-type)
        ;; TODO look into home-gpg-agent-service-type
        ;; TODO look into home-dotfiles-service
        (service home-ssh-agent-service-type))))
