(require 'package)

;;; Standard package repositories
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;;; Also use Melpa for most packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

;; Initialise, pleaze
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;; Add in your own as you wish:
(defvar my-packages '(god-mode

                      smex ;; for M-x goodness
                      ido-ubiquitous
                      idomenu

                      dired+
                      sr-speedbar
                      auto-complete
                      whole-line-or-region

                      ;; auto complete
                      auto-complete
                      ac-dabbrev
                      ac-emmet
                      ac-etags
                      ac-helm
                      ac-js2

                      discover

                      yasnippet
                      eldoc
                      autopair

                      idle-highlight-mode

                      ;; programming specific
                      editorconfig
                      ag

                      magit

                      move-text

		      ;; lisp
                      paredit
                      rainbow-delimiters
                      hl-sexp

                      ;; web
                      js2-mode
                      js2-refactor
                      emmet-mode
                      tagedit
                      highlight-indentation

                      niflheim-theme
                      heroku-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages)
