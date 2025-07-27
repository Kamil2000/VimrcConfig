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

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
; (setq package-archive-priorities '(("gnu" . 20)("melpa-stable" . 10)))
(setq package-enable-at-startup t)

(if (package-installed-p 'gnu-elpa-keyring-update)
  (setq package-check-signature 'allow-unsigned)
  (setq package-check-signature nil))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(setq package-selected-packages nil)

; BEGIN list of packages
(add-to-list 'package-selected-packages 'gnu-elpa-keyring-update t)
(add-to-list 'package-selected-packages 'treemacs t)
(add-to-list 'package-selected-packages 'lsp-mode t)
(add-to-list 'package-selected-packages 'lsp-ui t)
(add-to-list 'package-selected-packages 'company t)
(add-to-list 'package-selected-packages 'dap-mode t)
; END list of packages

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

; ===========================================

