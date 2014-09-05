;; Global minor modes etc.
(smex-initialize)
(sr-speedbar-toggle)

(whole-line-or-region-mode 1)
(auto-complete-mode 1)

(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;;; Automatically load changes in file from disc.
(global-auto-revert-mode t)

(transient-mark-mode t)

(provide 'initialise-modes)
