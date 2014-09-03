;;; GUI initialization

(set-face-attribute 'default nil :height 100 :font "Courier New")

(setq inhibit-startup-message t) ;; no splash screen

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)

(provide 'graphical-interface)
