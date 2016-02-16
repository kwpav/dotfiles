;;;;;;;;;;;;;;;;;
;; ~/.emacs.d/themes.el
;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("91fba9a99f7b64390e1f56319c3dbbaed22de1b9676b3c73d935bf62277b799c" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "e426d22803ef4c21c1735ca0cb638e80e0893cac629ce3b879b94bd3bb67a7a0" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "d5aac94c0051c3acec2b274347b343372b4e64c3e226be7b7c56725ea26b1ba8" "101a10b15bbbd0d5a0e56e4773e614962197886780afb2d62523a63a144ad96c" "890d09dcc8d2326e98eee74b307b2cc42f07ab7701bcff521e6152aa3e08f7a8" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" "294834baa9ca874795a3181cce7aaf228b1e3fb3899587ffd3ae7546de328c90" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "59ca830d4df5e79503b79103485d28c6a578ca14d526ffc6a43596808daf1282" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "d1a42ed39a15a843cccadf107ee0242b5f78bfbb5b70ba3ce19f3ea9fda8f52d" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; dark themes i like...
;;(load-theme 'spacemacs-dark)
(load-theme 'base16-ocean-dark)
;;(load-theme 'base16-tomorrow-dark)
;;(load-theme 'base16-twilight-dark)
;;(load-theme 'base16-default-dark)
;;(load-theme 'solarized-dark)
;;(setq solarized-distinct-fringe-background t)

;; light themes i like...
;;(load-theme 'spacemacs-light)
;;(load-theme 'light-soap)
;;(load-theme 'solarized-light)

;; font
(add-to-list 'default-frame-alist '(font . "Input Mono Narrow-9" ))
;;(add-to-list 'default-frame-alist '(font . "Hermit-9" ))
;;(add-to-list 'default-frame-alist '(font . "GohuFont-11" ))

;; hide the toolbar
(tool-bar-mode -1)
;; hide the scrollbar
(scroll-bar-mode -1)
(blink-cursor-mode 0)
