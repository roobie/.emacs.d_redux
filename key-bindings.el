;; Key bindings

(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "M-RET") 'newline)

(define-key global-map (kbd "M-e") 'yas/expand)

(define-key global-map (kbd "C-<tab>") 'other-window)

(provide 'key-bindings)
