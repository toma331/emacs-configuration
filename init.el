;; Disable toolbar, menu bar, and scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Disable bell
(setq ring-bell-function 'ignore)

;; Disable backup files
(setq make-backup-files nil)   ; Stop creating ~ backup files
(setq auto-save-default nil)   ; Stop creating #autosave# files

;; Show line numbers globally
(global-display-line-numbers-mode 1)

;; Optional: nicer defaults
;;(setq inhibit-startup-screen t)   ; Disable startup screen
(setq initial-scratch-message "") ; Empty scratch buffer

;; Set default tab width to 2
(setq-default tab-width 2)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wheatgrass)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq fancy-splash-image "~/.emacs.d/anime.png")

