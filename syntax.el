;; SYNTAX HIGHLIGHT

(defun remove-keyword-highlighting ()
  (let ((faces '(font-lock-comment-face font-lock-comment-delimiter-face font-lock-constant-face font-lock-type-face font-lock-function-name-face font-lock-variable-name-face font-lock-keyword-face font-lock-string-face font-lock-builtin-face font-lock-preprocessor-face font-lock-warning-face font-lock-doc-face)))
    (dolist (face faces)
      (set-face-attribute face nil :foreground nil :weight 'normal :slant 'normal)))

  (set-face-attribute 'font-lock-comment-delimiter-face nil :slant 'italic)
  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (set-face-attribute 'font-lock-doc-face nil :slant 'italic)
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  (set-face-attribute 'font-lock-builtin-face nil :weight 'bold)
  (set-face-attribute 'font-lock-preprocessor-face nil :weight 'bold))
(remove-keyword-highlighting)



(add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-hook 'after-init-hook 'remove-keyword-highlighting)

(provide 'syntax)
