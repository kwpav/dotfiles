(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; vim mode activate!
(evil-mode 1)
;; powerline theme
;;(powerline-center-evil-theme)
(powerline-evil-center-color-theme)

(add-to-list 'load-path "~/.emacs.d/spaceline")
;;(load-file "~/.emacs.d/spaceline/spaceline-config.el")
;;(require 'spaceline-config)
;;(spaceline-spacemacs-theme)

;; NERDTree replacement...
(global-set-key [f8] 'neotree-toggle)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("59ca830d4df5e79503b79103485d28c6a578ca14d526ffc6a43596808daf1282" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "d1a42ed39a15a843cccadf107ee0242b5f78bfbb5b70ba3ce19f3ea9fda8f52d" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; theme
;;(load-theme 'base16-ocean-dark)
(load-theme 'base16-twilight-dark)
;;(load-theme 'solarized-dark)
;;(setq solarized-distinct-fringe-background t)

;; font
(add-to-list 'default-frame-alist '(font . "Input Mono Narrow Medium-9" ))

;; (set-frame-font "Input Mono Regular-10" nil t)

;; hide the toolbar
(tool-bar-mode -1)
