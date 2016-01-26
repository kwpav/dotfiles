(in-package :stumpwm)

(setq *module-dir* "/home/kevin/.stumpwm.d/contrib")

;;;;
;; mouse focus 
(setq *mouse-focus-policy* :sloppy)
;;(setq *mouse-focus-policy* :click)
(run-shell-command "xsetroot -cursor_name left_ptr")

;;;;
;; appearance
(set-frame-outline-width 2)
;(set-fg-color (make-color-hex "#D7D0C7"))
;(set-bg-color (make-color-hex "#101010"))
;(set-border-color (make-color-hex "#E84F4F"))

;;;;
;; programs
(defcommand firefox () ()
  (run-or-raise "firefox" '(:class "Firefox")))
(define-key *top-map* (kbd "s-f") "firefox")

;; stumpwm already defines emacs
(define-key *top-map* (kbd "s-e") "emacs")

;; start urxvt with tmux, remaps default keybindingcs 'c' and 'C-c'
(defcommand urxvt () ()
  (run-or-raise "urxvtc -e tmux" '(:class "URxvt")))
(define-key *root-map* (kbd "c") "urxvt")
(define-key *root-map* (kbd "C-c") "urxvt")
(define-key *top-map* (kbd "s-RET") "urxvt")
(define-key *top-map* (kbd "s-c") "urxvt")

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
(define-key *top-map* (kbd "s-SPC") "pull-hidden-next")
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
;; groups
(define-key *top-map* (kbd "s-]") "gnext")
(define-key *top-map* (kbd "s-[") "gprev")
;; stump commands 
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-:") "eval")
(define-key *top-map* (kbd "s-R") "restart-hard")

;;;;
;; mode-line
(setf *screen-mode-line-format*
      (list "%h | %g | %w |"
	    '(:eval (run-shell-command "date" t))))
(setf *mode-line-pad-y* 5)
(setf *mode-line-pad-x* 10)
(setf *mode-line-timeout* 1)
(setf *mode-line-background-color* "#2b303b")
(setf *mode-line-foreground-color* "#eff1f5")
