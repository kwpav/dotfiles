;;; package --- Summary
;; ~/.emacs.d/init.el

;;; Commentary:
;; This loads emacs.org, where my actual config is.

;;; Code:

;;; -*- lexical-binding: t; -*-

;; This is supposed to speed things up, according to the doom emacs FAQ:
;; Emacs consults this variable every time a file is read or library loaded, or when certain functions in the file API are used (like expand-file-name or file-truename).
;; They do so to check if a special handler is needed to read it, but none of these handlers are necessary for the initialization work we do at startup, so it is generally safe to disable it (temporarily!):
;; It is important to restore this variable, otherwise you won’t be able to use TRAMP and Emacs will be unable to read compressed/encrypted files.
(defvar doom--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(org-babel-load-file "~/dotfiles/emacs.org")

;; Then restore it later:
(setq file-name-handler-alist doom--file-name-handler-alist)

;;; init.el ends here
