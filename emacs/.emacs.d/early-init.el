;;; early-init.el --- -*- lexical-binding: t -*-

;;; Commentary:
;; This file runs before init.el.
;; It mostly contains things to start up a little faster.

;;; Code:

;; (setq gc-cons-threshold most-positive-fixnum)

(setq package-enable-at-startup nil)

(setq site-run-file nil)

;; Prevent the glimpse of un-styled Emacs by disabling these UI elements early.
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t)

;; Ignore X resources; its settings would be redundant with the other settings
;; in this file and can conflict with later config (particularly where the
;; cursor color is concerned).
(advice-add #'x-apply-session-resources :override #'ignore)

(setq menu-bar-mode -99)
;; (setq tool-bar-mode nil) ;; hide the toolbar
;; (setq scroll-bar-mode nil) ;; hide the scrollbar
(set-fringe-mode '(10 . 0)) ;; remove the extra border around frames
(global-hl-line-mode 1) ;; highlight the current line

(provide 'early-init)

;;; early-init.el ends here
