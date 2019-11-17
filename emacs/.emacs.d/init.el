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
    ("5e62fe2e73f4d646f37a1d04e92e61bc3d808bbf5032718aba06c44b0638878c" default)))
 '(enable-recursive-minibuffers t)
 '(general-override-states
   (quote
    (insert emacs hybrid normal visual motion operator replace)))
 '(ivy-count-format "(%d/%d) ")
 '(ivy-height 20)
 '(ivy-use-virtual-buffers t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(org-babel-load-file "~/dotfiles/emacs.org")

;; Then restore it later:
(setq file-name-handler-alist doom--file-name-handler-alist)

;;; init.el ends here
