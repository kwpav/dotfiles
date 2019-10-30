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
    ("5e62fe2e73f4d646f37a1d04e92e61bc3d808bbf5032718aba06c44b0638878c" "70ed3a0f434c63206a23012d9cdfbe6c6d4bb4685ad64154f37f3c15c10f3b90" "82358261c32ebedfee2ca0f87299f74008a2e5ba5c502bde7aaa15db20ee3731" "001c2ff8afde9c3e707a2eb3e810a0a36fb2b466e96377ac95968e7f8930a7c5" "071f5702a5445970105be9456a48423a87b8b9cfa4b1f76d15699b29123fb7d8" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "a9d67f7c030b3fa6e58e4580438759942185951e9438dd45f2c668c8d7ab2caf" "5e0b63e0373472b2e1cf1ebcc27058a683166ab544ef701a6e7f2a9f33a23726" "36c86cb6c648b9a15d849026c90bd6a4ae76e4d482f7bcd138dedd4707ff26a5" "030346c2470ddfdaca479610c56a9c2aa3e93d5de3a9696f335fd46417d8d3e4" "ff829b1ac22bbb7cee5274391bc5c9b3ddb478e0ca0b94d97e23e8ae1a3f0c3e" "fa477d10f10aa808a2d8165a4f7e6cee1ab7f902b6853fbee911a9e27cf346bc" "51043b04c31d7a62ae10466da95a37725638310a38c471cc2e9772891146ee52" "886fe9a7e4f5194f1c9b1438955a9776ff849f9e2f2bbb4fa7ed8879cdca0631" "53760e1863395dedf3823564cbd2356e9345e6c74458dcc8ba171c039c7144ed" "7d4340a89c1f576d1b5dec57635ab93cdc006524bda486b66d01a6f70cffb08e" "9129c2759b8ba8e8396fe92535449de3e7ba61fd34569a488dd64e80f5041c9f" "f8067b7d0dbffb29a79e0843797efabdf5e1cf326639874d8b407e9b034136a4" "97965ccdac20cae22c5658c282544892959dc541af3e9ef8857dbf22eb70e82b" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "add84a254d0176ffc2534cd05a17d57eea4a0b764146139656b4b7d446394a54" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(lsp-php-workspace-root-detectors
   (quote
    (lsp-php-root-projectile lsp-php-root-composer-json "index.php" "robots.txt")))
 '(package-selected-packages
   (quote
    (dired-git-info diredfl doom-modeline doom-themes nord-theme clojure-mode challenger-deep-theme smart-jump ox-reveal counsel-etags kaolin-themes lispy treemacs-projectile treemacs-evil treemacs forge yaml-mode poet-theme objed ivy-explorer color-theme-sanityinc-tomorrow psysh spacemacs-theme eglot gruvbox-theme telephone-line git-gutter-fringe git-messenger ac-core-php all-the-icons anzu better-defaults company company-lsp company-php company-restclient company-tern counsel counsel-projectile diminish dumb-jump editorconfig evil evil-collection evil-magit evil-surround exec-path-from-shell eyebrowse flycheck geiser general git-timemachine haskell-mode htmlize hy-mode hydra ivy js2-mode json-mode keyfreq lsp-mode lsp-ui magit multi-term no-littering ob-restclient olivetti omnisharp org-bullets ox-pandoc paradox paredit php-eldoc php-mode phpcbf pipenv prettier-js projectile racket-mode rainbow-delimiters rainbow-mode restart-emacs restclient rjsx-mode slime smartparens solaire-mode stumpwm-mode swiper tern tide typescript-mode use-package use-package-ensure-system-package vi-tilde-fringe web-mode which-key yasnippet-classic-snippets yasnippet-snippets)))
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
