(defcustom preferred-javascript-mode
  (first (remove-if-not #'fboundp '(js2-mode js-mode js3-mode)))
  "Javascript mode to use for .js files."
  :type 'symbol
  :group 'programming
  :options '(js2-mode js3-mode js-mode))

(defvar preferred-javascript-indent-level 2)

;; JSX
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; You can edit user-customizable variables by typing the following command.
;;     M-x customize-group [RET] jsx-mode
(custom-set-variables
 '(jsx-indent-level 2)
 ;'(jsx-cmd-options '("--add-search-path" "/path/to/search-path"))
 ;'(jsx-use-flymake t)
 ;'(jsx-syntax-check-mode "compile"))
 )

(defun jsx-mode-init ()
  (define-key jsx-mode-map (kbd "C-c d") 'jsx-display-popup-err-for-current-line)
  (when (require 'auto-complete nil t)
    (auto-complete-mode t)))

(add-hook 'jsx-mode-hook 'jsx-mode-init)

;; Need to first remove from list if present, since elpa adds entries too, which
;; may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-alist (cons `("\\.js\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
                            (loop for entry in auto-mode-alist
                                  unless (eq preferred-javascript-mode (cdr entry))
                                  collect entry)))

;; js-mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . javascript-mode))
(setq js-indent-level preferred-javascript-indent-level)

;; js2-mode
(add-hook 'js2-mode-hook '(lambda () (setq mode-name "JS2")))
(setq js2-use-font-lock-faces t
      js2-mode-must-byte-compile nil
      js2-basic-offset preferred-javascript-indent-level
      js2-indent-on-enter-key t
      js2-auto-indent-p t
      js2-bounce-indent-p nil
      js2-highlight-level 3)

;; eg. extract function with `C-c r ef'.
(js2r-add-keybindings-with-prefix "C-c r")

(defvar js2-semicolon-contexts (list js2-NAME js2-LP js2-SCRIPT js2-CALL js2-BLOCK))
(defun autopair-js2-maybe-insert-semi-colon (action pair pos-before)
  "handler for automatically inserting semi-colon at the end of function call."
  ;; (message "node before is %s" (js2-node-type (js2-node-at-point (- (point) 1))))
  ;; (message "action is %s" action)
  ;; (message "pair is %c" pair)
  ;; (message "context is %s" (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
  ;; (message "point is %s" (point))
  (cond ((and (eq action 'opening)
              (eq pair ?\))
             (save-excursion
               (goto-char pos-before)
               (skip-chars-backward " \t")
               ;; (message "node is %s." (js2-node-type (js2-node-at-point (point))))
               (memq (js2-node-type (js2-node-at-point (point))) js2-semicolon-contexts)
               ))
         (save-excursion
           (let ((forward-sexp-function nil))
             (goto-char pos-before)
             (forward-sexp))
           (if (looking-at-p "[^[:graph:]]*$")
             (insert ";"))))))

(defun redux::js2-mode-setup ()
  (setq autopair-handle-action-fns
        (list #'autopair-default-handle-action
              #'autopair-js2-maybe-insert-semi-colon)))
(add-hook 'js2-mode-hook 'redux::js2-mode-setup)

(eval-after-load 'js2-mode '(js2-imenu-extras-setup))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))

(require 'js-comint)
;(setq inferior-js-program-command "/usr/bin/java org.mozilla.javascript.tools.shell.Main") ;; Rhino
(setq inferior-js-program-command "node --interactive") ;; node
(add-hook 'js2-mode-hook '(lambda ()
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)))

;; show indentation guides
;(require 'highlight-indentation)
;(add-hook 'js2-mode-hook 'highlight-indentation-mode)

(add-hook 'js2-mode-hook 'hs-minor-mode)
(provide 'javascript)
