
;;; https://github.com/ralph-moeritz/.emacs.d/
(prefer-coding-system 'utf-8) ;; prefer utf-8
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; auto-fill in text-mode
(put 'erase-buffer 'disabled nil) ;; enable erase-buffer
(winner-mode 1) ;; winner mode FTW
(put 'upcase-region 'disabled nil) ;; enable upcase-region
(setq-default fill-column 79) ;; fill at col 79

;;----------------------------------------------------------------------------
;; Some basic preferences (inspired by https://github.com/purcell/emacs.d)
;;----------------------------------------------------------------------------
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 bookmark-default-file "~/.emacs.d/.bookmarks.el"
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)

(fset 'yes-or-no-p 'y-or-n-p)

;; Remove trailing whitespace just before save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'saner-defaults)
