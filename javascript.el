(defcustom preferred-javascript-mode
  (first (remove-if-not #'fboundp '(js2-mode js-mode js3-mode)))
  "Javascript mode to use for .js files."
  :type 'symbol
  :group 'programming
  :options '(js2-mode js3-mode js-mode))

(defvar preferred-javascript-indent-level 2)

;; Need to first remove from list if present, since elpa adds entries too, which
;; may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-alist (cons `("\\.js\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
                            (loop for entry in auto-mode-alist
                                  unless (eq preferred-javascript-mode (cdr entry))
                                  collect entry)))

;; js2-mode
(add-hook 'js2-mode-hook '(lambda () (setq mode-name "JS2")))
(setq js2-use-font-lock-faces t
      js2-mode-must-byte-compile nil
      js2-basic-offset preferred-javascript-indent-level
      js2-indent-on-enter-key t
      js2-auto-indent-p t
      js2-bounce-indent-p nil
      js2-highlight-level 3)

(eval-after-load 'js2-mode '(js2-imenu-extras-setup))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))

(require 'js-comint)
;(setq inferior-js-program-command "/usr/bin/java org.mozilla.javascript.tools.shell.Main") ;; Rhino
(setq inferior-js-program-command
      "c:\\js\\js.exe") ;; spidermonkey
(add-hook 'js2-mode-hook '(lambda ()
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)))

;; show indentation guides
(require 'highlight-indentation)
(add-hook 'js2-mode-hook 'highlight-indentation-mode)


(provide 'javascript)
