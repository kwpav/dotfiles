(in-package :stumpwm)

;; the contrib/ folder is provided with the aur package
(set-module-dir (pathname-as-directory "/usr/share/stumpwm"))


;; (load-module "ttf-fonts")
;; (set-font (make-instance 'xft:font :family "Iosevka" :subfamily "Regular" :size 14))
;(load-module "ttf-fonts")
(load-module "swm-gaps")

(set-font "-*-cherry-*-*-*-*-13-*-*-*-*-*-*-*")

(set-prefix-key (kbd "s-SPC"))

;;;;
;; mouse focus 
(setq *mouse-focus-policy* :sloppy)
;;(setq *mouse-focus-policy* :click)
(run-shell-command "xsetroot -cursor_name left_ptr")

;;;;
;; appearance
(defparameter *foreground-color* "#A0B3C5")
(defparameter *background-color* "#10151C")
(defparameter *border-color* "#28323B")

(set-frame-outline-width 2)

;; (set-fg-color "#eeeeee")
;; (set-bg-color "#1C2028")
;; (set-border-color "#232731")
;; (set-focus-color "#3B4252")
;; (set-unfocus-color "#232731")
;; (set-win-bg-color "#22272F")
;; (set-float-focus-color "#3B4252")
;; (set-float-unfocus-color "#232731")

;; stump msg window
(setf *message-window-gravity* :center
      *input-window-gravity* :center
      *window-border-style* :thin
      *message-window-padding* 5
      *input-window-padding* 5)
(set-msg-border-width 4)
(set-fg-color *foreground-color*)
(set-bg-color *background-color*)
(set-border-color *border-color*)

;; frame borders
(setf *normal-border-width* 2
      *maxsize-border-width* 4
      *transient-border-width* 1)
(set-focus-color *border-color*)
(set-unfocus-color *background-color*)
(set-frame-outline-width 1)

;;;;
;; programs
(defcommand firefox () ()
  (run-or-raise "firefox" '(:class "Firefox")))
(define-key *top-map* (kbd "s-f") "firefox")

;; stumpwm already defines emacs
(define-key *top-map* (kbd "s-e") "emacs")

;; start termite with tmux, remaps default keybindingcs 'c' and 'C-c'
(defcommand termite () ()
  (run-or-raise "termite -e tmux" '(:class "Termite")))
(define-key *root-map* (kbd "c") "termite")
(define-key *root-map* (kbd "C-c") "termite")
(define-key *top-map* (kbd "s-RET") "termite")
(define-key *top-map* (kbd "s-c") "termite")

;; use stumpwm's exec instead of dmenu_run
(define-key *top-map* (kbd "s-d") "exec")

;;;;
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
;; (define-key *top-map* (kbd "s-SPC") "pull-hidden-next")
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
;; frames
(define-key *top-map* (kbd "s-o") "hsplit")
(define-key *top-map* (kbd "s-u") "vsplit")
(define-key *top-map* (kbd "s-r") "remove")
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
(define-key *top-map* (kbd "s-t") "toggle-gaps")
;; modeline
(define-key *top-map* (kbd "s-y") "mode-line")

;;;;
;; groups
(setf (group-name (car (screen-groups (current-screen)))) "dev")

;;;;
;; mode-line
;; (setf *screen-mode-line-format*
;;       (list "%g  |  %v  |  "
;; 	    '(:eval (run-shell-command "date" t))))
;; (setf *mode-line-pad-y* 5)
;; (setf *mode-line-pad-x* 10)
;; (setf *mode-line-timeout* 1)
;; (setf *mode-line-background-color* *background-color*)
;; (setf *mode-line-foreground-color* *foreground-color*)

;; from https://github.com/zarkone/stumpwm.d

(setf *bar-med-color* "^B^8")
(setf *bar-hi-color* "^B^3")
(setf *bar-crit-color* "^B^1")

(setf *colors*
      '("black"
       "red"
       "green"
       "yellow"
       "blue"
       "magenta"
       "cyan"
       "white"
       "GreenYellow"
       "#009696"))
(update-color-map (current-screen))

(setf *group-format* " %t ")
(setf *window-format* "%m%n%s%20t ")
(setf *mode-line-timeout* 2)

(setf *time-modeline-string* "^9 • , %a^n^B ^b")

(defun get-date-modeline ()
  (stumpwm:run-shell-command
   (format nil "date +\"~A\""
           *time-modeline-string*) t))

(defun get-layout-modeline ()
  (if (= 0 (get-current-layout *display*))
      "^3 en ^n"
      "^3^R ru ^r^n"))

(setf *screen-mode-line-format*
      (list "^B^3 %g ^n^b %v ^> "
            '(:eval (get-layout-modeline))
            "  "
            "^B^2^n^b "
            '(:eval (get-date-modeline))))

(setf *mode-line-border-width* 0)
(setf *mode-line-background-color* "#000809")
(setf *mode-line-foreground-color* "DeepSkyBlue")

(if (not (head-mode-line (current-head)))
(toggle-mode-line (current-screen) (current-head)))

;; polybar stuff based off of https://github.com/lepisma/cfg/blob/master/stumpwm/.stumpwmrc
;; (defun polybar-groups ()
;;   "Return string representation for polybar stumpgroups module"
;;   (apply #'concatenate 'string
;;          (mapcar
;;           (lambda (g)
;;             (let* ((name (group-name g))
;;                    (n-win (write-to-string (length (group-windows g))))
;;                    (display-text (concat " " name)))
;;               (if (eq g (current-group))
;;                   (concat "%{F#ECEFF4 B#882E3440 u#8A9899 +u}" display-text "[" n-win "] " "%{F- B- u- -u}")
;;                   (concat "%{F#8A9899}" display-text "[" n-win "] " "%{F-}"))))
;;           (sort (screen-groups (current-screen)) #'< :key #'group-number))))


;; (run-shell-command "polybar screen0 --reload")

;; ;; Update polybar group indicator
;; (add-hook *new-window-hook* (lambda (win) (run-shell-command "polybar-msg hook stumpwmgroups 1")))
;; (add-hook *destroy-window-hook* (lambda (win) (run-shell-command "polybar-msg hook stumpwmgroups 1")))
;; (add-hook *focus-window-hook* (lambda (win lastw) (run-shell-command "polybar-msg hook stumpwmgroups 1")))
;; (add-hook *focus-group-hook* (lambda (grp lastg) (run-shell-command "polybar-msg hook stumpwmgroups 1")))
