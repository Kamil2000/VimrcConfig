; basic settings
; to load copy file to ~/.emacs or ~/.emacs.el
; or use (load-file "path") to load this file in ~/.emacs.el

(load-theme 'wombat t)
(setq inhibit-startup-screen t)
(tool-bar-mode 0)
; (menu-bar-mode 0)

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

;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
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
; (global-set-key (kbd "C-c o") 'company-complete)
(define-key company-mode-map (kbd "C-SPC") 'company-complete)
(define-key company-mode-map (kbd "C-c o") 'company-complete)
(add-hook 'c-mode-hook 'company)
(add-hook 'c++-mode-hook 'company)
(add-hook 'python-mode-hook 'company)
(setq company-minimum-prefix-length 1) ; use only when idle dealy disables automatic mode
(setq company-idle-delay nil) ; disable automatic company

(require 'lsp-mode) ; M-x lsp-mode to enable
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-headerline-breadcrumb-enable nil)
(when (boundp 'lsp-enable-on-type-formatting)
  (setq lsp-enable-on-type-formatting nil))
(when (boundp 'lsp-idle-delay)
  (setq lsp-idle-delay 1))
;(add-hook 'lsp-mode-hook (lambda () (run-with-timer 2 nil 'turn-on-font-lock)))
(add-hook 'lsp-mode-hook 'turn-on-font-lock)
; CPP config
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
; PYTHON config
(add-hook 'python-mode-hook 'lsp)
(setq lsp-pylsp-plugins-flake8-enabled nil)
; (setq lsp-pylsp-plugins-pylint-enabled nil)
; (setq lsp-pylsp-plugins-pystyle-enabled nil)
(setq lsp-pylsp-plugins-pydocstyle-enabled nil)

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
(when (boundp 'flymake-show-diagnostics-at-end-of-line)
  (setq flymake-show-diagnostics-at-end-of-line t))

(require 'dap-mode)
(setq dap-auto-configure-features '(sessions locals controls tooltip))
(define-key dap-mode-map (kbd "C-c d n") 'dap-next)
(define-key dap-mode-map (kbd "C-c d s") 'dap-step-in)
(define-key dap-mode-map (kbd "C-c d S") 'dap-step-out)
(define-key dap-mode-map (kbd "C-c d c") 'dap-continue)

(define-key dap-mode-map (kbd "C-c d b") 'dap-breakpoint-add)
(define-key dap-mode-map (kbd "C-c d B") 'dap-breakpoint-delete)
(define-key dap-mode-map (kbd "C-c d R") 'dap-breakpoint-delete-all) ; remove
(define-key dap-mode-map (kbd "C-c d C-b") 'dap-breakpoint-condition)
(define-key dap-mode-map (kbd "C-c d M-b") 'dap-breakpoint-hit-condition)

(define-key dap-mode-map (kbd "C-c d d") 'dap-debug)
(define-key dap-mode-map (kbd "C-c d D") 'dap-debug-last)
(define-key dap-mode-map (kbd "C-c d C-d") 'dap-debug-recent)
(define-key dap-mode-map (kbd "C-c d M-d") 'dap-disconnect)

(define-key dap-mode-map (kbd "C-c d e") 'dap-eval-thing-at-point)
(define-key dap-mode-map (kbd "C-c d E") 'dap-eval)

(define-key dap-mode-map (kbd "C-c D b") 'dap-ui-breakpoints)
(define-key dap-mode-map (kbd "C-c D l") 'dap-ui-locals)
(define-key dap-mode-map (kbd "C-c D e") 'dap-ui-expressions)
(define-key dap-mode-map (kbd "C-c D o") 'dap-go-to-output-buffer)
(define-key dap-mode-map (kbd "C-c D h") 'dap-hydra)
(define-key dap-mode-map (kbd "C-c D D") 'dap-delete-all-sessions)

(require 'dap-python)
(setq dap-python-debugger 'debugpy) ; python -m pip install debugpy

