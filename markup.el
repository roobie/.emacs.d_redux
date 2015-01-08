
(add-hook 'html-mode-hook 'emmet-mode)

;; show indentation guides
(require 'highlight-indentation)
(add-hook 'html-mode-hook 'highlight-indentation-mode)
(add-hook 'html-mode-hook 'hs-minor-mode)

(provide 'markup)
