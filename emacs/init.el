; basinc settings
; to load copy file to ~/.emacs or ~/.emacs.el
; or use (load-file "path") to load this file in ~/.emacs.el

(load-theme 'manoj-dark t)

(add-hook 'prog-mode-hook
	  (lambda ()
	    (display-line-numbers-mode)
	    (electric-pair-local-mode)))

(add-hook 'text-mode-hook
	  (lambda ()
	    (display-line-numbers-mode)))

(setq backup-directory-alist '((".*" . "~/.Trash")))
(setq-default case-fold-search nil)
(global-tab-line-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-set-style "k&r")
(setq c-basic-offset 4)
; ==========================================

(require 'package)
(setq package-check-signature 'allow-unsigned) ; nil or 'allow-unsigned

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(setq package-archive-priorities '(("gnu" . 20)("melpa-stable" . 10)))

; package-selected-packages to see packages
; neotree, gnu-elpa-keyring-update (as quickfix)
; (package-initialize t)
; (setq package-enable-at-startup nil) ; necessery when above line uncommented

; ===========================================
