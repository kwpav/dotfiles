;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
             (gnu system nss)
             (guix utils)
             (gnu packages shells)
             (gnu packages zig-xyz)
             (nongnu packages linux)
             (nongnu system linux-initrd)
             (rosenthal packages wm))
(use-service-modules desktop xorg nix)
(use-package-modules certs gnome wm package-management)

(operating-system
 (kernel linux)
 (initrd microcode-initrd)
 (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/Chicago")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "valinor")

  (groups (cons* (user-group (name "nixbld")) %base-groups))

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                 (name "kpav")
                 (comment "Kevin Pavao")
                 (shell (file-append zsh "/bin/zsh"))
                 (group "users")
                 (home-directory "/home/kpav")
                 (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append
             (list
              ;; for HTTPS access
              ;; nss-certs
              ;; for user mounts
              gvfs
              zsh
              ;; nix
              hikari
              hyprland
              ;; sway
              river
              swayfx)
             ;; (map specification->package '("nss-certs"
             ;;                                      "git"
             ;;                                      "stow"
             ;;                                      "emacs"
             ;;                                      "sway"
             ;;                                      "vim"
             ;;                                      ;; for user mounts
             ;;                                      "gvfs"))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service gnome-desktop-service-type)
                 ;;(set-xorg-configuration
                 ;;(xorg-configuration (keyboard-layout keyboard-layout)))
                 ;; TODO add these?
                 ;; %base-services
                 ;;(service ntp-service-type) ;; sync system clock
                 ;;(service udisks-service-type) ;; usbs
                 ;;(service upower-service-type)
                 ;;(service polkit-service-type)
                 ;;(service elogind-service-type)
                 ;;(service dbus-root-service-type)
                 ;; (service nix-service-type)

                 ;; set this for lutris
                 (pam-limits-service
                  (list (pam-limits-entry "*" 'hard 'nofile 524288))))

           ;; This is the default list of services we
           ;; are appending to.
           (modify-services %desktop-services
                            (guix-service-type config =>
                                               (guix-configuration
                                                (inherit config)
                                                (substitute-urls
                                                 (append (list "https://substitutes.nonguix.org")
                                                         %default-substitute-urls))
                                                (authorized-keys
                                                 (append (list (local-file "signing-keys.pub"))
                                                         %default-authorized-guix-keys))))
                            (gdm-service-type config =>
                                              (gdm-configuration
                                               (inherit config)
                                               (wayland? #t))))))
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid
                                  "9d015f2d-1042-402f-92f6-77d3eb4d831c"
                                  'ext4))
                         (type "ext4"))
                       (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "C557-BFBA"
                                       'fat32))
                         (type "vfat")) %base-file-systems)))
