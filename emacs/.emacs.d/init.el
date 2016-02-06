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
;; org-mode
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


(use-package omnisharp
  :ensure t
  :init
  (setq omnisharp-server-executable-path "~/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode))
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
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;
;; TRAMP
;;(setq tramp-default-method "ssh")
;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "55ed02951e7b458e4cd18837eefa1956884c9afd22bb514f697fd1d2d1abb3d3" "f245c9f24b609b00441a6a336bcc556fe38a6b24bfc0ca4aedd4fe23d858ba31" "62408b3adcd05f887b6357e5bd9221652984a389e9b015f87bbc596aba62ba48" "ce585b387d84fc4bbb02b8766bfe82607f891e25602ec3550db858e09c10eb7d" "232f715279fc131ed4facf6a517b84d23dca145fcc0e09c5e0f90eb534e1680f" "4d80487632a0a5a72737a7fc690f1f30266668211b17ba836602a8da890c2118" "a25c42c5e2a6a7a3b0331cad124c83406a71bc7e099b60c31dc28a1ff84e8c04" "98a619757483dc6614c266107ab6b19d315f93267e535ec89b7af3d62fb83cad" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "e426d22803ef4c21c1735ca0cb638e80e0893cac629ce3b879b94bd3bb67a7a0" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "d5aac94c0051c3acec2b274347b343372b4e64c3e226be7b7c56725ea26b1ba8" "101a10b15bbbd0d5a0e56e4773e614962197886780afb2d62523a63a144ad96c" "890d09dcc8d2326e98eee74b307b2cc42f07ab7701bcff521e6152aa3e08f7a8" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" "294834baa9ca874795a3181cce7aaf228b1e3fb3899587ffd3ae7546de328c90" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "59ca830d4df5e79503b79103485d28c6a578ca14d526ffc6a43596808daf1282" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "d1a42ed39a15a843cccadf107ee0242b5f78bfbb5b70ba3ce19f3ea9fda8f52d" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(yas-global-mode t nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
