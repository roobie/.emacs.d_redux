;; Key bindings

(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "M-RET") 'newline)

(define-key global-map (kbd "M-e") 'yas/expand)

(define-key global-map (kbd "C-<tab>") 'other-window)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(global-set-key (kbd "C-c C-k") 'hs-hide-all)
(global-set-key (kbd "C-c C-l") 'hs-show-all)

(global-set-key [?\C-c ?d] 'duplicate-line)

(provide 'key-bindings)
