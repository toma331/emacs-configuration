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

;; Set default tab width to 4
(setq-default tab-width 4)

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


;; LSP


;; Package Archives
(require 'package)
(setq package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
        ("gnu"         . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)


;; lsp-mode (C only)
(use-package lsp-mode
  :commands lsp
  :hook (c-mode . lsp)
  :init
  (setq lsp-clients-clangd-executable "clangd"
        lsp-enable-on-type-formatting nil
        lsp-enable-formatting nil
        lsp-enable-completion-at-point nil
        lsp-enable-snippet nil
        lsp-enable-symbol-highlighting t
        lsp-signature-auto-activate nil
        ;; Only load C features
        lsp-language-id-configuration '((c-mode . "c"))))


;; lsp-ui (hover & peek)
(use-package lsp-ui
  :after lsp-mode
  :config
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable t
        lsp-ui-peek-enable t)
  ;; Keybindings
  (define-key lsp-mode-map (kbd "M-.") 'lsp-find-definition)
  (define-key lsp-mode-map (kbd "M-?") 'lsp-find-references)
  (define-key lsp-mode-map (kbd "C-c h") 'lsp-ui-doc-show)
  (define-key lsp-mode-map (kbd "C-c p d") 'lsp-ui-peek-find-definitions)
  (define-key lsp-mode-map (kbd "C-c p r") 'lsp-ui-peek-find-references))


;; Disable company-mode
(use-package company
  :config
  (add-hook 'lsp-mode-hook (lambda () (company-mode -1))))


;; Flycheck for diagnostics
(use-package flycheck
  :init (global-flycheck-mode))


;; Optional keybindings summary
;; M-.      : Go to definition
;; M-?      : Find references
;; C-c h    : Hover documentation
;; C-c p d  : Peek definition
;; C-c p r  : Peek references
