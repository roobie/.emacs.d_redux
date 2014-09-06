;; Global minor modes etc.
(ido-mode t)
(smex-initialize)
(sr-speedbar-toggle)

(whole-line-or-region-mode t)
(auto-complete-mode t)

(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;;; Automatically load changes in file from disc.
(global-auto-revert-mode t)

(transient-mark-mode t)

(yas-global-mode t)

(provide 'initialise-modes)
