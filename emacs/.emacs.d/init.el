;;;;;;;;;;;;;;;;;
;; ~/.emacs.d/init.el
;;;;;;;;;;;;;;;;;

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

;; Load the actual config file
(org-babel-load-file "~/dotfiles/emacs.org")
