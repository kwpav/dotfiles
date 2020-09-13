;;; early-init.el --- -*- lexical-binding: t -*-

;; (setq gc-cons-threshold 100000000)

(setq gc-cons-threshold most-positive-fixnum)

(setq package-enable-at-startup nil)

(menu-bar-mode -99)
(tool-bar-mode -1) ;; hide the toolbar
(scroll-bar-mode -1) ;; hide the scrollbar
(set-fringe-mode '(10 . 0)) ;; remove the extra border around frames
(global-hl-line-mode 1) ;; highlight the current line

(provide 'early-init)
