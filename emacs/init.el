; basinc settings
; to load copy file to ~/.emacs or ~/.emacs.el
; or use (load-file "path") to load this file in ~/.emacs.el

(load-theme 'wombat t)
(tool-bar-mode 0)
; (menu-bar-mode 0)
1
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

(require 'treemacs) 
(treemacs-indent-guide-mode t)
(global-set-key (kbd "C-c P") 'treemacs-add-and-display-current-project-exclusively)
(global-set-key (kbd "C-c p") 'treemacs)
(treemacs-project-follow-mode t)

(require 'company)
(global-set-key (kbd "C-c o") 'company-complete)
(add-hook 'after-init-hook 'global-company-mode) ; could be replaced later
(setq company-minimum-prefix-length 1) ; use only when idle dealy disables automatic mode
(setq company-idle-delay nil) ; disable automatic company

(require 'lsp-mode) ; M-x lsp-mode to enable
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-headerline-breadcrumb-enable nil)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(require 'flymake)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)
(setq flymake-no-changes-timeout nil)
(defun el-init-flymake-buf-diag()
  (interactive)
  (when (fboundp 'flymake-show-diagnostics-buffer)
    (flymake-show-diagnostics-buffer))
  (when (fboundp 'flymake-show-buffer-diagnostics)
    (flymake-show-buffer-diagnostics)))
(define-key flymake-mode-map (kbd "C-c l") 'el-init-flymake-buf-diag)
