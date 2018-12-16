;;;;;;;;;;;;;;;;;
;; ~/.emacs.d/init.el
;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"])
 '(custom-safe-themes
   (quote
    ("6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(lsp-php-workspace-root-detectors
   (quote
    (lsp-php-root-projectile lsp-php-root-composer-json "index.php" "robots.txt")))
 '(package-selected-packages
   (quote
    (eglot gruvbox-theme telephone-line git-gutter-fringe git-messenger ac-core-php all-the-icons anzu better-defaults company company-lsp company-php company-restclient company-tern counsel counsel-projectile diminish doom-modeline doom-themes dumb-jump editorconfig evil evil-collection evil-magit evil-surround exec-path-from-shell eyebrowse flycheck geiser general git-timemachine haskell-mode htmlize hy-mode hydra ivy js2-mode json-mode keyfreq lsp-mode lsp-python lsp-ui magit magithub multi-term no-littering ob-restclient olivetti omnisharp org-bullets ox-pandoc paradox paredit php-eldoc php-mode phpcbf pipenv prettier-js projectile racket-mode rainbow-delimiters rainbow-mode restart-emacs restclient rjsx-mode slime smartparens solaire-mode stumpwm-mode swiper tern tide treemacs treemacs-evil treemacs-projectile typescript-mode use-package use-package-ensure-system-package vi-tilde-fringe web-mode which-key yasnippet-classic-snippets yasnippet-snippets)))
 '(paradox-github-token t)
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-1 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-1 :height 1.0)))))

;; Load the actual config file
(org-babel-load-file "~/dotfiles/emacs.org")
