;;; package --- Summary
;; ~/.emacs.d/init.el

;;; Commentary:
;; This holds custom variables and loads emacs.org, where my actual config is

;;; Code:

;; -*- lexical-binding: t; -*-

;; This is supposed to speed things up, according to the doom emacs FAQ:
;; Emacs consults this variable every time a file is read or library loaded, or when certain functions in the file API are used (like expand-file-name or file-truename).
;; They do so to check if a special handler is needed to read it, but none of these handlers are necessary for the initialization work we do at startup, so it is generally safe to disable it (temporarily!):
;; It is important to restore this variable, otherwise you won’t be able to use TRAMP and Emacs will be unable to read compressed/encrypted files.
(defvar doom--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" "b30ab3b30e70f4350dad6bfe27366d573ace2190cc405c619bd5e602110c6e0c" "5e62fe2e73f4d646f37a1d04e92e61bc3d808bbf5032718aba06c44b0638878c" default)))
 '(dumb-jump-force-searcher (quote rg) t)
 '(dumb-jump-selector (quote ivy) t)
 '(enable-recursive-minibuffers t)
 '(evil-want-keybinding nil)
 '(flycheck-javascript-eslint-executable "eslint_d")
 '(geiser-active-implementations (quote (guile mit racket)) t)
 '(general-override-states
   (quote
    (insert emacs hybrid normal visual motion operator replace)))
 '(highlight-indent-guides-delay 0)
 '(highlight-indent-guides-method (quote character))
 '(highlight-indent-guides-responsive (quote top))
 '(inferior-lisp-program "/usr/bin/sbcl" t)
 '(ivy-count-format "(%d/%d) ")
 '(ivy-height 20)
 '(ivy-use-virtual-buffers t)
 '(js-chain-indent t t)
 '(js-indent-level 2 t)
 '(js2-basic-offset 2 t)
 '(lsp-ui-doc-border "#ECEFF4" t)
 '(lsp-ui-doc-enable t t)
 '(lsp-ui-doc-header t t)
 '(lsp-ui-doc-include-signature t t)
 '(lsp-ui-doc-position (quote top) t)
 '(lsp-ui-sideline-enable t t)
 '(lsp-ui-sideline-ignore-duplicate t t)
 '(lsp-ui-sideline-show-code-actions nil t)
 '(magit-completing-read-function (quote ivy-completing-read) t)
 '(org-agenda-files (quote ("~/org/agenda/")))
 '(slime-contribs (quote (slime-fancy)) t)
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Iosevka" :height 0.8))))
 '(org-document-title ((t (:foreground "#B48EAD" :weight bold :height 1.4))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3 :weight bold :foreground "#8fbcbb"))))
 '(org-level-2 ((t (:inherit outline-1 :height 1.2 :weight bold :foreground "#88c0d0"))))
 '(org-level-3 ((t (:inherit outline-1 :height 1.1 :weight bold :foreground "#81a1c1"))))
 '(org-level-4 ((t (:inherit outline-1 :height 1.0 :weight bold :foreground "#5e81ac"))))
 '(org-level-5 ((t (:inherit outline-1 :height 1.0 :weight bold))))
 '(variable-pitch ((t (:family "EtBembo" :height 160 :weight normal :slant normal)))))

(org-babel-load-file "~/dotfiles/emacs.org")

;; Then restore it later:
(setq file-name-handler-alist doom--file-name-handler-alist)

;;; init.el ends here
