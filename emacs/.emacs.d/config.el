;;; -*- lexical-binding: t; -*-

(setq user-full-name "Kevin Pavao"
      user-mail-address "kpavao84@gmail.com")

(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load-file custom-file))

(setq straight-repository-branch "develop")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-cache-autoloads t)

(setq straight-use-package-by-default t)

(straight-use-package 'use-package)
(straight-use-package 'diminish) ;; for :diminish
(straight-use-package 'bind-key) ;; for :bind

(use-package use-package-ensure-system-package)

(setq inhibit-startup-screen t
      initial-major-mode 'org-mode
      initial-scratch-message nil)

(use-package esup
  :commands (esup))

(use-package gcmh
  :hook (after-init . gcmh-mode))

(setq read-process-output-max (* 1024 1024)) ;; 1mb

(fset 'yes-or-no-p 'y-or-n-p)

(global-auto-revert-mode t)

(set-default-coding-systems 'utf-8)

(use-package better-defaults)

(setq make-backup-files nil ; stop creating backup~ files
      auto-save-default nil ; stop creating #autosave# files
      create-lockfiles nil) ; stop creating .# files

(use-package no-littering
  :init
  (setq no-littering-etc-directory
        (expand-file-name "etc/" user-emacs-directory))
  (setq no-littering-var-directory
        (expand-file-name "var/" user-emacs-directory)))

(setq show-paren-delay 0)
(show-paren-mode 1)

(use-package general
  :custom
  (general-override-states '(insert emacs hybrid normal visual motion operator replace))
  :config
  (general-override-mode)
  (general-evil-setup)
  (general-create-definer my-leader-def
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "M-SPC")

  (general-create-definer my-local-leader-def
    :states '(normal visual insert emacs)
    :prefix "SPC m"
    :non-normal-prefix "M-,")

  ;; define which-key prefixes
  (my-leader-def
    "p" '(:ignore t :wk "projects")
    "b" '(:ignore t :wk "buffers")
    "w" '(:ignore t :wk "windows")
    "r" '(:ignore t :wk "bookmarks")
    "t" '(:ignore t :wk "terminal")
    "g" '(:ignore t :wk "git")
    "q" '(:ignore t :wk "quit / restart")
    "P" 'hydra-straight-helper/body)

  (my-leader-def
    "c" 'comment-dwim
    "RET" 'make-frame-command
    "l" 'my/what-minor-mode
    ;; bookmarks
    "rm" 'bookmark-set
    "rb" 'bookmark-jump
    "rl" 'bookmark-bmenu-list
    ;; quit / restart
    "qq" 'save-buffers-kill-terminal
    "qr" 'restart-emacs))

(use-package which-key
  :custom
  (which-key-idle-delay 0)
  :config
  (which-key-mode)
  (which-key-setup-minibuffer)
  (which-key-setup-side-window-bottom))

(use-package hydra
  :config
  (defhydra hydra-zoom (global-map "<f5>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out")
    ("r" (text-scale-set 0) "reset")
    ("0" (text-scale-set 0) :bind nil :exit t))
  (defhydra hydra-straight-helper (:hint nil :color green)
    "
_c_heck all       |_f_etch all     |_m_erge all      |_n_ormalize all   |p_u_sh all
_C_heck package   |_F_etch package |_M_erge package  |_N_ormlize package|p_U_sh package
----------------^^+--------------^^+---------------^^+----------------^^+------------||_q_uit||
_r_ebuild all     |_p_ull all      |_v_ersions freeze|_w_atcher start   |_g_et recipe
_R_ebuild package |_P_ull package  |_V_ersions thaw  |_W_atcher quit    |prun_e_ build"
    ("c" straight-check-all)
    ("C" straight-check-package)
    ("r" straight-rebuild-all)
    ("R" straight-rebuild-package)
    ("f" straight-fetch-all)
    ("F" straight-fetch-package)
    ("p" straight-pull-all)
    ("P" straight-pull-package)
    ("m" straight-merge-all)
    ("M" straight-merge-package)
    ("n" straight-normalize-all)
    ("N" straight-normalize-package)
    ("u" straight-push-all)
    ("U" straight-push-package)
    ("v" straight-freeze-versions)
    ("V" straight-thaw-versions)
    ("w" straight-watcher-start)
    ("W" straight-watcher-quit)
    ("g" straight-get-recipe)
    ("e" straight-prune-build)
    ("q" nil)))

(use-package keyfreq
  :config
  (keyfreq-autosave-mode 1))

(defun my-emacs-in-normal-mode ()
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state))

(use-package evil
  :custom
  (evil-want-keybinding nil)  ;; evil-collection assumes this
  (evil-undo-system 'undo-fu)
  :config
  (evil-mode 1)
  (my-emacs-in-normal-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-avy
  :after evil
  :general
  (my-leader-def
    "jgg" 'evil-avy-goto-word-0
    "jgj" 'avy-goto-word-0-below
    "jgk" 'avy-goto-word-0-above))

(use-package evil-easymotion
  :after evil
  :general
  (my-leader-def
    "j" '(:ignore t :wk "easymotion")
    "jj" 'evilem-motion-next-line
    "jk" 'evilem-motion-previous-line
    "jw" 'evilem-motion-forward-word-begin
    "jb" 'evilem-motion-backward-word-begin
    "je" 'evilem-motion-forward-word-end
    "jW" 'evilem-motion-forward-WORD-begin
    "jE" 'evilem-motion-forward-WORD-end)
  :config
  (evilem-default-keybindings "S-SPC"))

(use-package vi-tilde-fringe
  :config
  (global-vi-tilde-fringe-mode 1))

(setq scroll-margin 10
      scroll-step 1
      next-line-add-newlines nil
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      mouse-wheel-follow-mouse 't
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(use-package ivy
  :demand t
  :general
  ("<f6>" 'ivy-resume)
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  (ivy-count-format "(%d/%d) ")
  (ivy-height 20)
  :config
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :demand t
  :general
  ("M-x" 'counsel-M-x)
  ("C-x C-f" 'counsel-find-file)
  ("<f1> f" 'counsel-describe-function)
  ("<f1> v" 'counsel-describe-variable)
  ("<f1> l" 'counsel-find-library)
  ("<f2> i" 'counsel-info-lookup-symbol)
  ("<f2> u" 'counsel-unicode-char)
  ("C-c g" 'counsel-git)
  ("C-c j" 'counsel-git-grep)
  ("C-c k" 'counsel-rg)
  ("C-x l" 'counsel-locate)
  ("C-S-r" 'counsel-expression-history)
  (my-leader-def
    "f" 'counsel-find-file
    "x" 'counsel-M-x)
  :config
  ;; use ripgrep for counsel-git-grep
  (setq counsel-git-cmd "rg --files")
  (setq counsel-rg-base-command
        "rg -i -M 120 --no-heading --line-number --color never %s ."))

(use-package counsel-etags
  :after counsel)

(use-package ivy-rich
  :after (ivy counsel)
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

(use-package swiper
  :after ivy
  :general
  ("C-s" 'swiper)
  (evil-normal-state-map "/" 'swiper))

(use-package anzu
  :config
  (global-anzu-mode)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))

(use-package undo-fu)

(use-package multiple-cursors
  :defer t
  :general
  (my-leader-def
    "v" 'mc/edit-lines))

(use-package iedit)

;; (menu-bar-mode -99)
;; (tool-bar-mode -1) ;; hide the toolbar
;; (scroll-bar-mode -1) ;; hide the scrollbar
(blink-cursor-mode 0) ;; dont blink the cursor
;; (set-fringe-mode '(10 . 0)) ;; remove the extra border around frames
;; (global-hl-line-mode 1) ;; highlight the current line

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  (doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  :config
  (load-theme 'doom-nord)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(add-to-list 'default-frame-alist '(font . "Iosevka-12"))

(use-package all-the-icons
  :defer t)

(defun my-doom-modeline-setup ()
  (column-number-mode)
  (doom-modeline-mode 1))

(use-package doom-modeline
  :demand t
  :init (my-doom-modeline-setup)
  :custom
  (doom-modeline-vcs-max-length 50)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))

(use-package solaire-mode
  ;; Ensure solaire-mode is running in all solaire-mode buffers
  :hook (change-major-mode . turn-on-solaire-mode)
  ;; ...if you use auto-revert-mode, this prevents solaire-mode from turning
  ;; itself off every time Emacs reverts the file
  :hook (after-revert . turn-on-solaire-mode)
  ;; To enable solaire-mode unconditionally for certain modes:
  :hook (ediff-prepare-buffer . solaire-mode)
  ;; Highlight the minibuffer when it is activated:
  :hook (minibuffer-setup . solaire-mode-in-minibuffer)
  :config
  (setq solaire-mode-auto-swap-bg nil)
  (solaire-global-mode +1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(setq frame-resize-pixelwise t)

(defun my-active-minor-modes ()
  "Get a list of active minor-mode symbols."
  (delq nil
        (mapcar
         (lambda (x)
           (let ((car-x (car x)))
             (when (and (symbolp car-x) (symbol-value car-x))
               x)))
         minor-mode-alist)))

(defun my/what-minor-mode (mode)
  "Get information on an active minor mode. Use `describe-minor-mode' for a
selection of all minor-modes, active or not."
  (interactive
   (list (completing-read "Minor mode: "
                          (my-active-minor-modes))))
  (describe-minor-mode-from-symbol
   (cl-typecase mode
     (string (intern mode))
     (symbol mode)
     (t (error "Expected a symbol/string, got a %s" (type-of mode))))))

(my-leader-def
  "c" 'comment-dwim
  "RET" 'make-frame-command
  "l" 'my/what-minor-mode
  ;; buffers and windows
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "wo" 'split-window-horizontally
  "wu" 'split-window-vertically
  "wd" 'delete-window
  "wh" 'windmove-left
  "wj" 'windmove-down
  "wk" 'windmove-up
  "wl" 'windmove-right
  "w." 'eyebrowse-switch-to-window-config
  "w," 'eyebrowse-rename-window-config
  "w1" 'eyebrowse-switch-to-window-config-1
  "w2" 'eyebrowse-switch-to-window-config-2
  "w3" 'eyebrowse-switch-to-window-config-3
  "w4" 'eyebrowse-switch-to-window-config-4
  "w4" 'eyebrowse-switch-to-window-config-4
  "w5" 'eyebrowse-switch-to-window-config-5
  "w6" 'eyebrowse-switch-to-window-config-6
  "w7" 'eyebrowse-switch-to-window-config-7
  "w8" 'eyebrowse-switch-to-window-config-8
  "w9" 'eyebrowse-switch-to-window-config-9
  "w0" 'eyebrowse-switch-to-window-config-0)

(use-package eyebrowse
  :config
  (eyebrowse-mode t))

(windmove-default-keybindings)

(use-package dired
  :straight nil
  :hook (dired-mode . dired-hide-details-mode)
  :config
  ;; Colourful columns.
  (use-package diredfl
    :config
    (diredfl-global-mode 1)))

(use-package dired-git-info
    :bind (:map dired-mode-map
                ("C-(" . dired-git-info-mode)))

(use-package projectile
  :config
  (projectile-global-mode))

(use-package counsel-projectile
  :after (counsel projectile)
  :general
  (my-leader-def
    "pf" 'counsel-projectile-find-file
    "pd" 'counsel-projectile-find-dir
    "pb" 'counsel-projectile-switch-to-buffer
    "pp" 'counsel-projectile-switch-project
    "pg" 'counsel-projectile-rg) ;;ripgrep
  :config
  (counsel-projectile-mode))

(use-package treemacs
  :defer t
  :general ([f8] 'treemacs))

(use-package treemacs-evil
  :after (evil treemacs))

(use-package treemacs-projectile
  :after (projectile treemacs))

(defun my-org-prettify-hook ()
  (turn-on-visual-line-mode)
  (variable-pitch-mode 1)
  (my-auto-lightweight-mode))

(use-package org-superstar)

(defun my-auto-lightweight-mode ()
  "Start Org Superstar differently depending on the number of lists items."
  (let ((list-items
         (count-matches "^[ \t]*?\\([+-]\\|[ \t]\\*\\)"
                        (point-min) (point-max))))
    (unless (< list-items 100)
      (org-superstar-toggle-lightweight-lists)))
  (org-superstar-mode 1))

(defun my-org-prettify-settings ()
  (setq org-startup-indented t
        org-src-fontify-natively t
        org-hide-emphasis-markers t
        org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        line-spacing 0.2)
  ;; (font-lock-add-keywords 'org-mode
  ;;                         '(("^\\([-+]\\) "
  ;;                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (my-org-faces))

(defun my-org-faces ()
  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "EtBembo" :height 160 :weight normal :slant normal))))
   '(fixed-pitch ((t (:family "Iosevka" :height 0.8))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-document-title ((t (:foreground "#B48EAD" :weight bold :height 1.4))))
   '(org-level-1 ((t (:inherit outline-1 :height 1.3 :weight bold :foreground "#8fbcbb"))))
   '(org-level-2 ((t (:inherit outline-1 :height 1.2 :weight bold :foreground "#88c0d0"))))
   '(org-level-3 ((t (:inherit outline-1 :height 1.1 :weight bold :foreground "#81a1c1"))))
   '(org-level-4 ((t (:inherit outline-1 :height 1.0 :weight bold :foreground "#5e81ac"))))
   '(org-level-5 ((t (:inherit outline-1 :height 1.0 :weight bold))))
   '(org-block-begin-line ((t (:inherit 'fixed-pitch :background nil))))
   '(org-block-end-line ((t (:inherit 'org-block-begin-line)))))
  (mapc
   (lambda (face)
     (set-face-attribute face nil :inherit 'fixed-pitch))
   (list 'org-code
         'org-link
         'org-block
         'org-table
         'org-verbatim
         'org-meta-line
         'org-document-info-keyword)))

(use-package htmlize
  :defer t)

(defun my-org-todo-setup ()
  (setq org-use-fast-todo-selection t)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "CURRENT(c)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(a@/!)")))
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "#BF616A" :weight bold)
                ("NEXT" :foreground "#5E81AC" :weight bold)
                ("CURRENT" :foreground "#88C0D0" :weight bold)
                ("DONE" :foreground "#A3BE8C" :weight bold)
                ("WAITING" :foreground "#D08770" :weight bold)
                ("HOLD" :foreground "#848EAD" :weight bold)
                ("CANCELLED" :foreground "#8FBCBB" :weight bold))))
  (setq org-log-done 'time))

(defun my-org-structure-templates ()
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("sh" . "src sh")))

(defun my-org-capture-templates ()
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/agenda/todo.org" "Tasks")
           "* TODO %?\n %i\n %a")
          ("s" "Standup" entry (file+olp+datetree "~/org/agenda/todo.org" "Standup")
           "* Planned\n- %?\n %i\n %a"))))

(use-package org
  :defer t
  :straight nil                         ;use built in version
  :general
  (org-src-mode-map
   [remap evil-save-and-close]          'org-edit-src-exit
   [remap evil-save-modified-and-close] 'org-edit-src-exit
   [remap evil-quit]                    'org-edit-src-abort)
  (my-leader-def
    "a" 'org-agenda)
  (my-local-leader-def 'org-mode-map
    "b" 'org-babel-tangle
    "t" 'org-todo)
  :gfhook
  #'my-org-prettify-hook
  :hook (org-src-mode . my-disable-flycheck-for-elisp)
  :preface
  (defun my-disable-flycheck-for-elisp ()
    (setq-local flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
  :custom
  (org-agenda-files (list "~/org/agenda/"))
  :config
  (my-org-prettify-settings)
  (my-org-todo-setup)
  (my-org-structure-templates)
  (my-org-capture-templates))

(use-package org-babel
  :no-require
  :straight nil
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package company
  :config
  (global-company-mode))

(setq lsp-keymap-prefix "C-l")

(use-package lsp-mode
  :hook (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp
  :custom
  (lsp-completion-provider :capf))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package dap-mode)

(use-package smartparens
  :config
  (smartparens-global-mode))

(use-package yasnippet
 :custom
 (yas-snippet-dirs
  '("~/.emacs.d/snippets"))
 :config
 (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package editorconfig
  :delight
  :config
  (editorconfig-mode 1))

(use-package magit
  :defer t
  :general
  ("C-x g" 'magit-status)
  (my-leader-def
    "gs" 'magit-status
    "gc" 'magit-checkout
    "gC" 'magit-commit
    "gb" 'magit-blame
    "gS" 'magit-stage-file
    "gU" 'magit-unstage-file
    "gg" 'hydra-my-git-menu/body
    "gy" 'my/magit-yank-branch-name)
  :custom
  (magit-completing-read-function 'ivy-completing-read)
  :config
  (defun my/magit-yank-branch-name ()
    "Show the current branch in the echo-area and add it to the `kill-ring'."
    (interactive)
    (let ((branch (magit-get-current-branch)))
      (if branch
          (progn (kill-new branch)
                 (message "%s" branch))
        (user-error "There is not current branch")))))

(use-package evil-magit
  :after (magit evil))

(use-package forge
  :after magit)

(use-package git-timemachine
  :defer t)

(use-package git-messenger
  :defer t)

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode 1)
  (setq-default fringes-outside-margins t)
  (define-fringe-bitmap 'git-gutter-fr:added
    [240 240 240 240 240 240 240 240 240 240 240 240 240 240]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:modified
    [240 240 240 240 240 240 240 240 240 240 240 240 240 240]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:deleted
    [0 0 0 128 192 224 240 248]
    nil nil 'center)
  (fringe-helper-define 'git-gutter-fr:added '(center repeated)
    "XXX.....")
  (fringe-helper-define 'git-gutter-fr:modified '(center repeated)
    "XXX.....")
  (fringe-helper-define 'git-gutter-fr:deleted 'bottom
    "X......."
    "XX......"
    "XXX....."
    "XXXX...."))

(use-package git-link
  :general
  (my-leader-def
    "gl" '(:ignore t :wk "git link")
    "gll" 'git-link
    "glc" 'git-link-commit
    "glh" 'git-link-homepage))

(use-package browse-at-remote
  :general
  (my-leader-def
    "glg" 'browse-at-remote))

(defhydra hydra-my-git-menu (global-map "<f7>"
                                        :color blue)
  "
^Navigate^        ^Action^               ^Info^
^^^^^^^^^^^^---------------------------------------------------
_j_: next hunk    _s_: stage hunk        _d_: diff
_k_: prev hunk    _S_: stage file        _c_: show commit
^ ^               _U_: unstage file      _g_: magit status
^ ^               ^ ^                    _t_: git timemachine
^ ^               ^ ^                    ^ ^
"
  ("j" git-gutter:next-hunk)
  ("k" git-gutter:previous-hunk)
  ("s" git-gutter:stage-hunk)
  ("S" magit-stage-file)
  ("U" magit-unstage-file)
  ("c" git-messenger:popup-show)
  ("g" magit-status :exit t)
  ("d" magit-diff-buffer-file)
  ("t" git-timemachine :exit t)
  ("q" quit-window "quit-window")
  ("<ESC>" git-gutter:update-all-windows "quit" :exit t))

(defhydra hydra-my-git-timemachine-menu (:color blue)
  ("s" git-timemachine "start")
  ("j" git-timemachine-show-next-revision "next revision")
  ("k" git-timemachine-show-previous-revision "prev revision")
  ("c" git-timemachine-show-current-revision "curr revision")
  ("<ESC>" git-timemachine-show-current-revision "quit" :exit t))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

(when (eq system-type 'darwin)
  (mac-auto-operator-composition-mode))

(when (eq system-type 'darwin)
  (setq python-shell-interpreter "/usr/local/bin/python3"))

(use-package stumpwm-mode
  :if (memq window-system '(x)))

(when (eq window-system 'x)
  (defun my/stumpwm-connect ()
    (interactive)
    (sly-connect "localhost" "4004")))

(org-babel-load-file "~/dotfiles/emacs-local.org")

(use-package erc
  :defer t
  :ensure nil
  :preface
  (defun erc-start-or-switch ()
    "Start ERC or switch to ERC buffer if it has started already."
    (interactive)
    (if (get-buffer "irc.freenode.net:6697")
        (erc-track-switch-buffer 1)
      (erc-tls :server "irc.freenode.net" :port 6697 :nick my-irc-nick :full-name user-full-name)))
  :init
  (defcustom my-irc-nick "kpav"
    "Nickname used to log into IRC"
    :type 'string)
  :custom
  (erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#archlinux" "#python" "#clojure" "#hy" "#stumpwm")))
  (erc-track-exclude-types '("NICK" "PART" "MODE" "324" "329" "332" "333" "353" "477"))
  (erc-server-coding-system '(utf-8 . utf-8))
  (erc-interpret-mirc-color t)
  (erc-kill-buffer-on-part t)
  (erc-kill-queries-on-quit t)
  (erc-kill-server-buffer-on-quit t))

(use-package restart-emacs
  :defer t)

(use-package multi-term
  :general
  (my-leader-def
    "tt" 'multi-term
    "tn" 'multi-term-next
    "tp" 'multi-term-prev)
  :defer t)

(use-package restclient
  :defer  t)

(use-package company-restclient
  :defer t)

(use-package ob-restclient
  :defer t)

(setq c-default-style "linux"
      c-basic-offset 4)

(use-package dockerfile-mode
  :defer t)

(use-package docker
  :defer t)

(use-package haskell-mode
  :mode "\\.hs\\'"
  :hook (haskell-mode . turn-on-haskell-indent))

(use-package js2-mode
  :mode "\\.js$"
  :hook (js2-mode . lsp)
  :interpreter "node"
  :ensure-system-package ((typescript-language-server . "npm i -g typescript-language-server")
                          (eslint_d . "npm i -g eslint_d"))
  :custom
  ;; set the indent level to 2
  (js2-basic-offset 2)
  (js-chain-indent t)
  (js-indent-level 2)
  ;; use eslint_d instead of eslint for faster linting
  (flycheck-javascript-eslint-executable "eslint_d"))

(use-package json-mode
  :mode "\\.json\\'")

(use-package typescript-mode
  :mode "\\.ts$"
  :hook (typescript-mode . lsp))

;; (use-package tide
;;   :config
;;   ;; aligns annotation to the right hand side
;;   (setq company-tooltip-align-annotations t)
;;   ;; formats the buffer before saving
;;   (add-hook 'before-save-hook 'tide-format-before-save)
;;   (add-hook 'typescript-mode-hook
;;             (lambda ()
;;               (interactive)
;;               (tide-setup)
;;               (flycheck-mode +1)
;;               (setq flycheck-check-syntax-automatically '(save-mode-enabled))
;;               (eldoc-mode +1)
;;               (tide-hl-identifier-mode +1)))
;;   (add-hook 'tide-mode-hook
;;             (lambda ()
;;               (define-key tide-mode-map (kbd "<f12>") 'tide-jump-to-definition))))

(use-package rjsx-mode
  :mode "\\.jsx\\'")

(use-package skewer-mode
  :defer t
  :ghook ('js2-mode-hook)
  :general
  (my-local-leader-def 'js2-mode-map
    "eb" 'skewer-eval-defun
    "el" 'skewer-eval-last-expression))

(which-key-add-major-mode-key-based-replacements 'clojure-mode "SPC m e" "eval")
(which-key-add-major-mode-key-based-replacements 'emacs-lisp-mode "SPC m e" "eval")
(which-key-add-major-mode-key-based-replacements 'hy-mode "SPC m e" "eval")
(which-key-add-major-mode-key-based-replacements 'lisp-interaction-mode "SPC m e" "eval")
(which-key-add-major-mode-key-based-replacements 'scheme-mode "SPC m e" "eval")

(defconst my-lisp-mode-hooks
  '(lisp-mode-hook
    sly-mrepl-mode-hook
    emacs-lisp-mode-hook
    scheme-mode-hook
    geiser-repl-mode-hook
    hy-mode-hook
    inferior-hy-mode-hook
    clojure-mode-hook
    cider-repl-mode-hook))

(defun my-lisp-setup ()
  (turn-off-smartparens-mode))

(use-package paredit
  :defer t
  :ghook my-lisp-mode-hooks
  :gfhook #'my-lisp-setup)

;; (defun my-lisp-setup ()
;;   (turn-off-smartparens-mode)
;;   (lispyville-mode 1))

;; (use-package lispyville)

;; (use-package lispy
;;   :defer t
;;   :ghook my-lisp-mode-hooks
;;   :gfhook #'my-lisp-setup
;;   :general
;;   ("\"" 'lispy-quotes)
;;   ("(" 'lispy-parens)
;;   (")" 'lispy-right-nostring)
;;   ("}" 'lispy-brackets)
;;   ("{" 'lispy-braces)
;;   ("[" 'lispy-forward)
;;   ("]" 'lispy-backward)
;;   (";" 'lispy-comment))

(my-local-leader-def
  :keymaps 'emacs-lisp-mode-map
  "eb" 'eval-buffer
  "el" 'eval-last-sexp
  "ed" 'eval-defun
  "er" 'eval-region)

(my-local-leader-def
  :keymaps 'lisp-interaction-mode-map
  "eb" 'eval-buffer
  "el" 'eval-last-sexp
  "ed" 'eval-defun
  "er" 'eval-region)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(use-package clojure-mode
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  (setq lsp-enable-indentation nil))

(use-package cider
  :after clojure-mode
  :hook (cider-repl-mode . rainbow-delimiters-mode)
  :general
  (my-local-leader-def 'clojure-mode-map
    "r" 'cider
    "n" 'cider-repl-set-ns
    "er" 'cider-eval-region
    "eb" 'cider-eval-buffer
    "el" 'cider-eval-last-sexp))

(use-package sly
  :defer t
  :hook (sly-mrepl-mode . rainbow-delimiters-mode)
  :general
  (my-local-leader-def
    :keymaps 'lisp-mode-map
    "eb" 'sly-eval-buffer
    "el" 'sly-eval-last-expression
    "ed" 'sly-eval-defun
    "er" 'sly-eval-region)
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl"))

(use-package sly-quicklisp
  :after sly)

(use-package sly-asdf
  :after sly)

(use-package hy-mode
  :mode "\\.hy\\'"
  :general
  (my-local-leader-def 'hy-mode-map
    "er" 'hy-shell-eval-region
    "eb" 'hy-shell-eval-buffer
    "el" 'hy-shell-eval-last-sexp
    "ed" 'hy-shell-eval-current-form))

(use-package geiser
  :defer t
  :general
  (my-local-leader-def
    :keymaps 'scheme-mode-map
    "r" 'run-geiser
    "er" 'geiser-eval-region
    "eR" 'geiser-eval-region-and-go
    "eb" 'geiser-eval-buffer
    "eB" 'geiser-eval-buffer-and-go
    "ed" 'geiser-eval-definition
    "eD" 'geiser-eval-definition-and-go
    "el" 'geiser-eval-eval-sexp)
  :custom
  (geiser-active-implementations '(guile mit racket)))

(use-package php-mode
  :mode "\\.php\\'"
  :gfhook #'my-php-setup
  :general
  (general-define-key
   :keymaps 'php-mode-map
   "C-c a" 'my/align-php-dbl-arrow)
  (my-local-leader-def 'php-mode-map
    "a" 'my/align-php-dbl-arrow
    "j" 'lsp-find-definition)
  :custom
  ;; align -> on successive lines
  (php-lineup-cascaded-calls t)
  (flycheck-phpcs-standard "WellspringCodingStandard"))

(defun my-php-setup ()
  (php-enable-default-coding-style)
  (setq lsp-enable-file-watchers nil)
  (lsp))

(defun my/align-php-dbl-arrow ()
  "Align the => in arrays."
  (interactive)
  (align-regexp
   (region-beginning) (region-end)
   "\\(\\s-*\\) => " 1 0 nil))

(use-package phpcbf
  :after (php-mode)
  ;;:hook ((php-mode . phpcbf-enable-on-save))
  :custom
  (phpcbf-executable "/usr/local/bin/phpcbf")
  (phpcbf-standard "WellspringCodingStandard"))

(use-package psysh
  :defer t)

(use-package python
  :mode "\\.py\\'"
  :ghook
  ('python-mode-hook #'lsp)
  :general
  (my-local-leader-def 'python-mode-map
    "er" 'python-shell-send-region
    "eb" 'python-shell-send-buffer
    "ef" 'python-shell-send-file
    "es" 'python-shell-send-string))

(use-package pipenv
  :hook ((python-mode . pipenv-mode)
         (hy-mode . pipenv-mode))
  :init
  (setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended))

;; (use-package lsp-jedi
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;     (add-to-list 'lsp-disabled-clients 'pyls)
;;     (add-to-list 'lsp-enabled-clients 'jedi)))

;; (use-package elpy
;;   :config
;;   (elpy-enable))

(use-package web-mode
  :defer t
  :preface
  (defun my-web-mode-hook ()
    ;; set the html indent to 2
    (setq web-mode-markup-indent-offset 2)
    (setq evil-shift-width 2)
    ;; highlight matching elements in html
    (setq web-mode-enable-current-element-highlight 1))
  :hook (web-mode . my-web-mode-hook)
  :init
  ;; (setq web-mode-ac-sources-alist
  ;;       '(("css" . (ac-source-css-property))
  ;;         ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  (add-hook 'web-mode-before-auto-complete-hooks
            '(lambda ()
               (let ((web-mode-cur-language
                      (web-mode-language-at-pos))))))
  (add-to-list `auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list `auto-mode-alist '("\\.css\\'" . web-mode)))

(use-package yaml-mode
  :defer t)
