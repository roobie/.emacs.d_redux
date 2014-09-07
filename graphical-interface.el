;;; GUI initialization

(set-face-attribute 'default nil :height 110 :font "Consolas")

(setq inhibit-startup-message t) ;; no splash screen

(global-linum-mode 1)

(show-paren-mode 1)

(menu-bar-mode -1)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(provide 'graphical-interface)
