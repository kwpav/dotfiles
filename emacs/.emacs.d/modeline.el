;;;;;;;;;;;;;;;;;
;; modeline.el
;;;;;;;;;;;;;;;;;

(use-package nyan-mode
  :ensure t
  :init
  (setq nyan-wavy-trail t)
  :config
  (nyan-mode 1)
  (nyan-start-animation))

;(require 'spaceline-config)
;(spaceline-spacemacs-theme)
;(setq powerline-default-separator 'wave)

;;;;;;;;;;;;;;;;;
;; custom modeline
;; TODO: make these work!
;;(set-variable 'nyan-wavy-trail t)
;;(setq nyan-start-animation 't)

(setq-default mode-line-format
	      (list
     "-- " 
     ;; the buffer name; the file name as a tool tip
     '(:eval (propertize "%b " 'face 'font-lock-keyword-face
 			'help-echo (buffer-file-name)))

    ;; the current major mode for the buffer.
     "["

     '(:eval (propertize "%m" 'face 'font-lock-string-face
			 'help-echo buffer-file-coding-system))
     " -"
     minor-mode-alist ;; the minor modes for the current buffer
     "] "

     "[" ;; insert vs overwrite mode, input-method in a tooltip
     '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
 	    'face 'font-lock-preprocessor-face
 	    'help-echo (concat "Buffer is in "
                            (if overwrite-mode "overwrite" "insert") " mode")))

     ;; was this buffer modified since the last save? 
     '(:eval (when (buffer-modified-p)
 	    (concat ","  (propertize "Mod"
 	    'face 'font-lock-warning-face
                              'help-echo "Buffer has been modified"))))

     ;; is this buffer read-only?
     '(:eval (when buffer-read-only
               (concat ","  (propertize "RO"
                              'face 'font-lock-type-face
                              'help-echo "Buffer is read-only"))))  
     "] "
    
     ;; line and column
     "(" ;; '%02' to set to 2 chars at least; prevents flickering
       (propertize "%02l" 'face 'font-lock-type-face) ","
       (propertize "%02c" 'face 'font-lock-type-face) 
     ") "

     '(:eval (list (nyan-create)))
    
     ;; relative position, size of file
     "["
     (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
     ;;"/"
     ;;(propertize "%I" 'face 'font-lock-constant-face) ;; size
     "] "

     " %-" ;; fill with '-'
     ))

;; change mode-line color by evil state
;;(lexical-let ((default-color (cons (face-background 'mode-line)
;;				    (face-foreground 'mode-line))))
;;    (add-hook 'post-command-hook
;;    (lambda ()
;;	(let ((color (cond ((minibufferp) default-color)
;;			((evil-insert-state-p) '("#eee" . "#ffffff"))
;;			((evil-emacs-state-p)  '("#444488" . "#ffffff"))
;;			((buffer-modified-p)   '("#006fa0" . "#ffffff"))
;;			(t default-color))))
;;	(set-face-background 'mode-line (car color))
;;	(set-face-foreground 'mode-line (cdr color))))))

;;;;;;;;;;;;;;;;;

