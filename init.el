;;; Define the list of files to load
(defvar *load-files* 
  '(graphical-interface
    packages))

;; Load the files in the .emacs.d directory
(defvar *base-path* (expand-file-name "~/.emacs.d"))
(dolist (file *load-files*)
  (load (format "%s/%s" *base-path* file))
  (require file))

;;; Local changes:
;; (create a 'local.el' file with custom code for it to be loaded:
(when (file-exists-p (expand-file-name "~/.emacs.d/local.el"))
  (progn
    (load (expand-file-name "~/.emacs.d/local.el"))
    (require 'local)))

(require 'server)
(unless (server-running-p)
  (server-start))
