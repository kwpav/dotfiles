(in-package :stumpwm)
(set-module-dir (pathname-as-directory "/usr/share/stumpwm"))
(load-module "swm-gaps")

(set-prefix-key (kbd "s-SPC"))

(setq *mouse-focus-policy* :sloppy)
;;(setq *mouse-focus-policy* :click)
(run-shell-command "xsetroot -cursor_name left_ptr")

(defcommand firefox () ()
  (run-or-raise "firefox" '(:class "Firefox")))
(define-key *top-map* (kbd "s-f") "firefox")

;; stumpwm already defines emacs
(define-key *top-map* (kbd "s-e") "emacs")

(defcommand termite () ()
  (run-or-raise "termite -e tmux" '(:class "Termite")))
(defcommand urxvt () ()
  (run-or-raise "urxvt -e tmux" '(:class "URxvt")))
(define-key *root-map* (kbd "c") "urxvt")
(define-key *root-map* (kbd "C-c") "urxvt")
(define-key *top-map* (kbd "s-RET") "urxvt")
(define-key *top-map* (kbd "s-c") "urxvt")

;; use stumpwm's exec instead of dmenu_run
(define-key *top-map* (kbd "s-d") "exec")

;; resize
;; TODO: figure out how to tell which window is selected in order to resize like other WMs
(define-key *top-map* (kbd "C-s-l") "resize 10 0")
(define-key *top-map* (kbd "C-s-k") "resize 0 10")
;; groups
(define-key *top-map* (kbd "s-]") "gnext")
(define-key *top-map* (kbd "s-[") "gprev")
;; stump commands 
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-:") "eval")
(define-key *top-map* (kbd "s-R") "restart-hard")
;; gaps
(define-key *top-map* (kbd "s-g") "toggle-gaps")
;; modeline
(define-key *top-map* (kbd "s-y") "mode-line")

;; frames
(define-key *top-map* (kbd "s-o") "hsplit")
(define-key *top-map* (kbd "s-u") "vsplit")
(define-key *top-map* (kbd "s-r") "remove")

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

(set-font "-*-cherry-*-*-*-*-13-*-*-*-*-*-*-*")

(setf *colors*
      '("#1D252C" ; black
       "#D95468"  ; red
       "#8BD49C"  ; green
       "#EBBF83"  ; yellow
       "#5EC4FF"  ; blue
       "#E27EBD"  ; magenta
       "#70E1E8"  ; cyan
       "#A0B3C5"  ; white
       "GreenYellow"
       "#10151C"))
(update-color-map (current-screen))

(defparameter *foreground-color* "#A0B3C5")
(defparameter *background-color* "#10151C")
(defparameter *border-color* "#28323B")

(setf *message-window-gravity* :center
      *input-window-gravity* :center
      *window-border-style* :thin
      *message-window-padding* 5
      *input-window-padding* 5)
(set-msg-border-width 4)
(set-fg-color *foreground-color*)
(set-bg-color *background-color*)
(set-border-color *border-color*)

(set-frame-outline-width 2)
(setf *normal-border-width* 2
      *maxsize-border-width* 4
      *transient-border-width* 1)
(set-focus-color *border-color*)
(set-unfocus-color *background-color*)
(set-frame-outline-width 1)

(setf *mode-line-pad-y* 5)
(setf *mode-line-pad-x* 10)
(setf *mode-line-timeout* 1)

(setf *bar-med-color* "^B^8")
(setf *bar-hi-color* "^B^4")
(setf *bar-crit-color* "^B^1")

;(setf *group-format* " %t ")
(setf *window-format* "%m%n%s%20t ")
(setf *mode-line-timeout* 2)

(setf *time-modeline-string* "^8 • , %a^n^B ^b")

(defun get-date-modeline ()
  (stumpwm:run-shell-command
   (format nil "date"
           *time-modeline-string*) t))

(defun get-layout-modeline ()
  (if (= 0 (get-current-layout *display*))
      "^4 en ^n"
      "^4^R ru ^r^n"))

(setf *screen-mode-line-format*
      (list "^B^4 %g ^n^b %v ^> "
            '(:eval (get-layout-modeline))
            "  "
            "^B^2^n^b "
            '(:eval (get-date-modeline))))

(setf *hidden-window-color* "^7")
(setf *mode-line-border-width* 0)
;; the foreground is the highlight for the windows too
(setf *mode-line-background-color* *background-color*)
(setf *mode-line-foreground-color* *foreground-color*)

(if (not (head-mode-line (current-head)))
(toggle-mode-line (current-screen) (current-head)))
