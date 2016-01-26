;;;;;;;;;;;;;;;;;
;; ~/.emacs.d/init.el
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;
;; package.el
(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)

(require 'use-package)
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;;; esc quits
;;(define-key evil-normal-state-map [escape] 'keyboard-quit)
;;(define-key evil-visual-state-map [escape] 'keyboard-quit)
;;(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;;(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; python
(use-package jedi
  :ensure t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))
  ;;(setq jedi:tooltip-show t)
  ;;(setq jedi:tooltip-method '(popup)))
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; autocomplete
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; neotree
(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (add-hook 'neotree-mode-hook
	    (lambda ()
	      (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	      (define-key evil-normal-state-local-map (kbd "q") 'neotree-enter))))
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; slime
(use-package slime
  :ensure t
  :config
  (setq inferior-list-program "sbcl"))
;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/modeline.el")
(load-file "~/.emacs.d/themes.el")
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; CUSTOM KEYS
;; buffer movement
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)
;; TODO: make this work!!
;;(global-set-key [f1] '(menu-bar-mode -1))
;; NERDTree replacement...


;;;;;;;;;;;;;;;;;
;; TRAMP
;;(setq tramp-default-method "ssh")
;;;;;;;;;;;;;;;;;
