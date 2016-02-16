;;;;;;;;;;;;;;;;;
;; ~/.emacs.d/init.el
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;
;; package setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(require 'use-package)
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; other config files
(load-file "~/.emacs.d/modeline.el")
(load-file "~/.emacs.d/themes.el")
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;;; esc quits
;(define-key evil-normal-state-map [escape] 'keyboard-quit)
;(define-key evil-visual-state-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; org-mode
;; TODO: get org contrib to work!
(use-package org
  :ensure org-plus-contrib)
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; yasnippet
;(use-package yasnippet
;  :ensure t
;  :init
;  (setq yas-snippet-dirs
;	'("~/.emacs.d/snippets"))
;  :config
;  (yas-global-mode 1))
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; python
(use-package jedi
  :ensure t
  :init
  (setq jedi:complete-on-dot t)
  :config
  (add-hook 'python-mode-hook 'jedi:setup))
  ;;(setq jedi:tooltip-show t)
  ;;(setq jedi:tooltip-method '(popup)))
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; c#
(use-package csharp-mode
  :ensure t
  :init
  ;(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
  (setq auto-mode-alist
     (append '(("\\.cs$" . csharp-mode)) auto-mode-alist)))

;; omnisharp should load after a csharp file is loaded
(use-package omnisharp
  :ensure t
  :init
  (setq omnisharp-server-executable-path "~/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode))

;; omnisharp evil-mode keys...
;; taken from: https://github.com/OmniSharp/omnisharp-emacs/blob/master/example-config-for-evil-mode.el
(evil-define-key 'insert omnisharp-mode-map (kbd "M-.") 'omnisharp-auto-complete)
(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
(evil-define-key 'normal omnisharp-mode-map (kbd "g u") 'omnisharp-find-usages)
(evil-define-key 'normal omnisharp-mode-map (kbd "g I") 'omnisharp-find-implementations) ; g i is taken
(evil-define-key 'normal omnisharp-mode-map (kbd "g o") 'omnisharp-go-to-definition)
(evil-define-key 'normal omnisharp-mode-map (kbd "g r") 'omnisharp-run-code-action-refactoring)
(evil-define-key 'normal omnisharp-mode-map (kbd "g f") 'omnisharp-fix-code-issue-at-point)
(evil-define-key 'normal omnisharp-mode-map (kbd "g F") 'omnisharp-fix-usings)
(evil-define-key 'normal omnisharp-mode-map (kbd "g R") 'omnisharp-rename)
(evil-define-key 'normal omnisharp-mode-map (kbd ", i") 'omnisharp-current-type-information)
(evil-define-key 'normal omnisharp-mode-map (kbd ", I") 'omnisharp-current-type-documentation)
(evil-define-key 'insert omnisharp-mode-map (kbd ".") 'omnisharp-add-dot-and-auto-complete)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n t") 'omnisharp-navigate-to-current-file-member)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n s") 'omnisharp-navigate-to-solution-member)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n f") 'omnisharp-navigate-to-solution-file-then-file-member)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n F") 'omnisharp-navigate-to-solution-file)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n r") 'omnisharp-navigate-to-region)
(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
(evil-define-key 'insert omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
(evil-define-key 'normal omnisharp-mode-map (kbd ",.") 'omnisharp-show-overloads-at-point)
(evil-define-key 'normal omnisharp-mode-map (kbd ",rl") 'recompile)

(evil-define-key 'normal omnisharp-mode-map (kbd ",rt")
  (lambda() (interactive) (omnisharp-unit-test "single")))

(evil-define-key 'normal omnisharp-mode-map
  (kbd ",rf")
  (lambda() (interactive) (omnisharp-unit-test "fixture")))

(evil-define-key 'normal omnisharp-mode-map
  (kbd ",ra")
  (lambda() (interactive) (omnisharp-unit-test "all")))

;; Speed up auto-complete on mono drastically. This comes with the
;; downside that documentation is impossible to fetch.
(setq omnisharp-auto-complete-want-documentation nil)
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
  :init
  (setq inferior-list-program "sbcl"))
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; undo-tree
;; press <C-x u> to use
(use-package undo-tree
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; magit
(global-set-key (kbd "C-x g") 'magit-status)
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; helm
;(use-package helm
;  :ensure t
;  ;;:diminish helm-mode
;  :init
;  (require 'helm-config)
;  (helm-mode))
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
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; random things

;; change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;


