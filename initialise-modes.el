;; Global minor modes etc.
(ido-mode t)

;;; Smex
;;(smex-initialize) ;;smex-initialize does not do exactly what we want, so:
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")
(global-set-key (kbd "M-x") 'smex)
(defadvice smex (around space-inserts-hyphen activate compile)
        (let ((ido-cannot-complete-command
               `(lambda ()
                  (interactive)
                  (if (string= " " (this-command-keys))
                      (insert ?-)
                    (funcall ,ido-cannot-complete-command)))))
          ad-do-it))

(sr-speedbar-toggle)

(whole-line-or-region-mode t)
(auto-complete-mode t)

(hs-minor-mode t)

(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;;; Automatically load changes in file from disc.
(global-auto-revert-mode t)

(transient-mark-mode t)

(yas-global-mode t)

(provide 'initialise-modes)
