;; setup load-path and autoloads
(add-to-list 'load-path "~/.emacs.d/packages/slime")
;; (require 'slime) ;; error...
(require 'slime-autoloads)

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

;; Set your lisp system
; --> (setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
;; and, optionally, some contribs
; --> (setq slime-contribs '(slime-js))

(provide 'slime-configuration)
