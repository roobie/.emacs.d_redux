
(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-log-messages t)
(require 'icomplete)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)


(provide 'clojure)
