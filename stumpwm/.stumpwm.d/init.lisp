(in-package :stumpwm)
;; (set-module-dir (pathname-as-directory "/usr/share/stumpwm"))
(set-module-dir (pathname-as-directory "/home/kevin/.stumpwm.d/modules"))

(require :slynk)
(defcommand stump-slynk-server () ()
  (slynk:create-server :port 4004
                       :dont-close t))
(stump-slynk-server)

(set-prefix-key (kbd "s-SPC"))

;; (setq *mouse-focus-policy* :sloppy)
(setq *mouse-focus-policy* :click)
(run-shell-command "xsetroot -cursor_name left_ptr")

(defcommand firefox () ()
  (run-or-raise "firefox" '(:class "firefox")))
(define-key *top-map* (kbd "s-f") "firefox")

;; stumpwm already defines emacs
(define-key *top-map* (kbd "s-e") "emacs")

(defcommand alacritty () ()
  (run-or-raise "alacritty -e tmux" '(:class "Alacritty")))

(defcommand kitty () ()
  (run-or-raise "kitty" '(:class "kitty")))

(defcommand terminal () ()
  (kitty))

(define-key *root-map* (kbd "c") "terminal")
(define-key *root-map* (kbd "C-c") "terminal")
(define-key *top-map* (kbd "s-RET") "terminal")
(define-key *top-map* (kbd "s-c") "terminal")

;; (define-key *top-map* (kbd "s-d") "exec")
(define-key *top-map* (kbd "s-F") "fullscreen")
(define-key *top-map* (kbd "s-w") "windowlist")
;; resize
(define-key *top-map* (kbd "C-s-l") "resize 10 0")
(define-key *top-map* (kbd "C-s-k") "resize 0 10")
;; groups
(define-key *top-map* (kbd "s-]") "gnext")
(define-key *top-map* (kbd "s-[") "gprev")
;; stump commands 
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-:") "eval")
(define-key *top-map* (kbd "s-R") "restart-hard")
;; modeline
(define-key *top-map* (kbd "s-y") "mode-line")
;; frames
(define-key *top-map* (kbd "s-o") "hsplit")
(define-key *top-map* (kbd "s-u") "vsplit")
(define-key *top-map* (kbd "s-r") "remove-split")

;; navigation
(define-key *top-map* (kbd "s-TAB") "fnext")
(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-j") "move-focus down")
(define-key *top-map* (kbd "s-k") "move-focus up")
(define-key *top-map* (kbd "s-l") "move-focus right")
;; window movement
(define-key *top-map* (kbd "s-H") "move-window left")
(define-key *top-map* (kbd "s-J") "move-window down")
(define-key *top-map* (kbd "s-K") "move-window up")
(define-key *top-map* (kbd "s-L") "move-window right")
(define-key *top-map* (kbd "s-n") "pull-hidden-next")
(define-key *top-map* (kbd "s-p") "pull-hidden-previous")
(define-key *top-map* (kbd "s-M") "exchange-direction down")
(define-key *top-map* (kbd "s-N") "exchange-direction left")
(define-key *top-map* (kbd "s-<") "exchange-direction up")
(define-key *top-map* (kbd "s->") "exchange-direction right")
;; groups
(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")
(define-key *top-map* (kbd "s-3") "gselect 3")
(define-key *top-map* (kbd "s-4") "gselect 4")
(define-key *top-map* (kbd "s-5") "gselect 5")
(define-key *top-map* (kbd "s-6") "gselect 6")
(define-key *top-map* (kbd "s-7") "gselect 7")
(define-key *top-map* (kbd "s-8") "gselect 8")
(define-key *top-map* (kbd "s-9") "gselect 9")
(define-key *top-map* (kbd "s-0") "gselect 0")
(define-key *top-map* (kbd "s-!") "gmove 1")
(define-key *top-map* (kbd "s-@") "gmove 2")
(define-key *top-map* (kbd "s-#") "gmove 3")
(define-key *top-map* (kbd "s-$") "gmove 4")
(define-key *top-map* (kbd "s-%") "gmove 5")
(define-key *top-map* (kbd "s-^") "gmove 6")
(define-key *top-map* (kbd "s-&") "gmove 7")
(define-key *top-map* (kbd "s-*") "gmove 8")
(define-key *top-map* (kbd "s-(") "gmove 9")
(define-key *top-map* (kbd "s-)") "gmove 0")

;;(setf (group-name (car (screen-groups (current-screen)))) "dev")
(run-commands "grename dev")

(defcommand my-power-menu () ()
  (let ((choice
         (select-from-menu (current-screen) '("shutdown" "restart" "quit") nil 0 nil)))
    (cond ((null choice)
           (throw 'error "Aborted."))
          ((string= choice "shutdown")
           (run-shell-command "poweroff"))
          ((string= choice "restart")
           (run-shell-command "reboot"))
          ((string= choice "quit")
           (quit)))))

(define-key *top-map* (kbd "s-ESC") "my-power-menu")

;; (run-shell-command "xsetroot -solid \"#2E3440\"" )
;; (run-shell-command "nitrogen --set-scaled ~/wallpapers/cathedralpillars.jpg")
(run-shell-command "nitrogen --set-centered --head=0 --set-color=\"#2E3440\" ~/wallpapers/silversurfer-nord.png && nitrogen --set-centered --head=1 --set-color=\"#2E3440\" ~/wallpapers/silversurfer-nord.png")
;; (run-shell-command "nitrogen --set-centered --head=1 --set-color=\"#2E3440\" ~/wallpapers/silversurfer-nord.png")
;; (run-shell-command "nitrogen --restore &")

(setf *colors*
      '("#2E3440"                       ; black
        "#BF616A"                       ; red
        "#A3BE8C"                       ; green
        "#EBCB8B"                       ; yellow
        "#5E81AC"                       ; blue
        "#B48EAD"                       ; magenta
        "#88C0D0"                       ; cyan
        "#ECEFF4"                       ; white
        "#A3BE8C"                       ; spring-green
        "#D8DEE9"                       ; gray9
        ))

(update-color-map (current-screen))

(defparameter *foreground-color* "#ECEFF4")
(defparameter *background-color* "#2E3440")
(defparameter *border-color* "#5E81AC")

(setf *message-window-gravity* :center
      *input-window-gravity* :center
      *window-border-style* :thin
      *message-window-padding* 5
      *input-window-padding* 5)
(set-msg-border-width 4)
(set-fg-color *foreground-color*)
(set-bg-color *background-color*)
(set-border-color *border-color*)

(set-frame-outline-width 1)
(setf *normal-border-width* 2)
(setf *maxsize-border-width* 4)
(setf *transient-border-width* 2)
(set-focus-color *border-color*)
(set-unfocus-color *background-color*)

(setf *mode-line-timeout* 2)

(setf *mode-line-border-width* 0)
(setf *mode-line-pad-y* 5)
(setf *mode-line-pad-x* 10)

(setf *bar-med-color* "^B^8")
(setf *bar-hi-color* "^B^4")
(setf *bar-crit-color* "^B^1")
(setf *hidden-window-color* "^7")
;; the foreground is the highlight for the windows too
(setf *mode-line-background-color* *background-color*)
(setf *mode-line-foreground-color* *foreground-color*)

(setf *group-format* " %n%s%t ")
(setf *window-format* "%m%n:%20t ")

(defun my-time ()
  "Return the time, HH:MM"
  (multiple-value-bind
        (second minute hour day month year day-of-week)
      (get-decoded-time)
    (format nil "~2,'0d:~2,'0d" hour minute)))

(defun my-date ()
  "Return the date, YYYY-MM-DD"
  (multiple-value-bind
        (second minute hour day month year day-of-week)
      (get-decoded-time)
    (format nil "~4,'0d-~2,'0d-~2,'0d" year month day)))

(load-module "cpu")
(load-module "mem")
(load-module "net")

(setf *screen-mode-line-format*
      (list "^9[%h]^n ^B^8%g^n^b %v"
            "^>"
            "^n^b^9 %l| %M| %C | "
            '(:eval (my-date))
            "^B^6 "
            '(:eval (my-time))))

;; (if (not (head-mode-line (current-head)))
;;     (toggle-mode-line (current-screen) (current-head)))

(load-module "swm-gaps")

(setf swm-gaps:*inner-gaps-size* 8)
(setf swm-gaps:*outer-gaps-size* 10)

(define-key *top-map* (kbd "s-g") "toggle-gaps")
