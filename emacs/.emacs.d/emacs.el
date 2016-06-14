
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(require 'use-package)

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

(use-package org
  :ensure org-bullets
  ;;:ensure org-plus-contrib
  :config
  (setq org-src-fontify-natively t)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'turn-on-visual-line-mode)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode 1))))

;(use-package htmlize
;   :ensure t)
;(setq org-src-fontify-natively t)

;(use-package yasnippet
;  :ensure t
;  :init
;  (setq yas-snippet-dirs
;       '("~/.emacs.d/snippets"))
;  :config
;  (yas-global-mode 1))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-enter))))

(use-package slime
  :ensure t
  :init
  (setq inferior-list-program "sbcl"))

(use-package undo-tree
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status))

(use-package evil-magit
  :ensure t)

(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-autoresize-max-height 40)
  :bind
  ("C-c h" . helm-mini)
  ("C-c a" . helm-apropos)
  ("M-x" . helm-M-x)
  ("C-x f" . helm-find-files))

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(fset 'yes-or-no-p 'y-or-n-p)

(use-package jedi
  :ensure t
  :init
  (setq jedi:complete-on-dot t)
  :config
  (add-hook 'python-mode-hook 'jedi:setup))
  ;;(setq jedi:tooltip-show t)
  ;;(setq jedi:tooltip-method '(popup)))

(use-package csharp-mode
  :ensure t
  :init
  ;(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
  (setq auto-mode-alist
     (append '(("\\.cs$" . csharp-mode)) auto-mode-alist)))

(use-package omnisharp
  :ensure t
  :init
  (setq omnisharp-server-executable-path "~/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode))

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

(setq c-default-style "linux"
      c-basic-offset 4)

(setq show-paren-delay 0)
(show-paren-mode 1)

(use-package paredit
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'lisp-mode-hook 'paredit-mode))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'lisp-mode-hook #'rainbow-delimiters-mode))

(use-package haskell-mode
  :ensure t
  :init
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent))

(menu-bar-mode -99)

(load-theme 'base16-tomorrow-dark)

;;(load-theme 'spacemacs-dark)
;;(load-theme 'base16-tomorrow-dark)
;;(load-theme 'base16-twilight-dark)
;;(load-theme 'base16-default-dark)
;;(load-theme 'solarized-dark)
;;(setq solarized-distinct-fringe-background t)
;;(load-theme 'base16-ocean-dark)
;;(load-theme 'material)
;;(load-theme 'spacegray)
;;(load-theme 'dracula)

;;(load-theme 'reykjavik)
;;(set-cursor-color "gainsboro")

;;(load-theme 'spacemacs-light)
;;(load-theme 'light-soap)
;;(load-theme 'solarized-light)

(add-to-list 'default-frame-alist '(font . "Monaco-10" ))

;;(add-to-list 'default-frame-alist '(font . "Input Mono Narrow-11" ))
;;(add-to-list 'default-frame-alist '(font . "Hermit-10" ))
;;(add-to-list 'default-frame-alist '(font . "Monaco-10" ))
;;(add-to-list 'default-frame-alist '(font . "Fantasque Sans Mono-11" ))
;;(add-to-list 'default-frame-alist '(font . "GohuFont-14" ))

(menu-bar-mode -99)
(tool-bar-mode -1) ;; hide the toolbar
(scroll-bar-mode -1) ;; hide the scrollbar 
(blink-cursor-mode 0) ;; dont blink the cursor
(set-fringe-mode '(0 . 0)) ;; remove the extra border around frames

(use-package nyan-mode
  :ensure t
  :init
  (setq nyan-wavy-trail t)
  :config
  (nyan-mode 1)
  (nyan-start-animation))

;(require 'spaceline-config)
;(spaceline-spacemacs-theme)
;(setq powerline-default-separator 'wave)

(setq-default mode-line-format
              (list
     "-- " 
     ;; the buffer name; the file name as a tool tip
     '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                        'help-echo (buffer-file-name)))

    ;; the current major mode for the buffer.
     "["

     '(:eval (propertize "%m" 'face 'font-lock-string-face
                         'help-echo buffer-file-coding-system))
     " -"
     minor-mode-alist ;; the minor modes for the current buffer
     "] "

     "[" ;; insert vs overwrite mode, input-method in a tooltip
     '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
            'face 'font-lock-preprocessor-face
            'help-echo (concat "Buffer is in "
                            (if overwrite-mode "overwrite" "insert") " mode")))

     ;; was this buffer modified since the last save? 
     '(:eval (when (buffer-modified-p)
            (concat ","  (propertize "Mod"
            'face 'font-lock-warning-face
                              'help-echo "Buffer has been modified"))))

     ;; is this buffer read-only?
     '(:eval (when buffer-read-only
               (concat ","  (propertize "RO"
                              'face 'font-lock-type-face
                              'help-echo "Buffer is read-only"))))  
     "] "
    
     ;; line and column
     "(" ;; '%02' to set to 2 chars at least; prevents flickering
       (propertize "%02l" 'face 'font-lock-type-face) ","
       (propertize "%02c" 'face 'font-lock-type-face) 
     ") "

     '(:eval (list (nyan-create)))
    
     ;; relative position, size of file
     "["
     (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
     ;;"/"
     ;;(propertize "%I" 'face 'font-lock-constant-face) ;; size
     "] "

     " %-" ;; fill with '-'
     ))

;; change mode-line color by evil state
;;(lexical-let ((default-color (cons (face-background 'mode-line)
;;                                  (face-foreground 'mode-line))))
;;    (add-hook 'post-command-hook
;;    (lambda ()
;;      (let ((color (cond ((minibufferp) default-color)
;;                      ((evil-insert-state-p) '("#eee" . "#ffffff"))
;;                      ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
;;                      ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
;;                      (t default-color))))
;;      (set-face-background 'mode-line (car color))
;;      (set-face-foreground 'mode-line (cdr color))))))
