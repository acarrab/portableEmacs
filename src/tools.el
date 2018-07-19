;;; src/tools --- list of commonly used packages
;;; Commentary:
;;; Code:



(use-package flycheck :ensure t
  :init (global-flycheck-mode)
  )


;; Auto-complete ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company :ensure t :init (global-company-mode)
  :config (defvar company-dabbrev-downcase)
  :bind ("C-c C-SPC" . company-complete))

;; displays files in current directory in nice way ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package treemacs :ensure t :bind ("C-c l" . treemacs))

;; moving around windows in emacs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ace-window :ensure t :bind ("C-c j" . ace-window))

;; improves ability to type repetitive code segments quickly ;;;;;;;;;;;;;;;;;;
(use-package yasnippet :ensure t :init (yas-global-mode 1))
(use-package yasnippet-snippets :ensure t)

;; allows for asynchronous file copy/move mostly with dired mode ;;;;;;;;;;;;;;
(use-package async :ensure t :bind ("C-c c" . async-shell-command))



(use-package multi-term :ensure t
  :init (progn
	  ;; (setenv "SHELL" "/bin/zsh")
	  ;; (setq-default explicit-shell-file-name "/bin/zsh")

	  (defun run-term ()
	    "Creates multi-term terminal in current window."
	    (interactive)
	    (multi-term)
	    (setq-default truncate-lines nil)
	    )
	  )
  :bind ("C-c t" . run-term)
  )

(use-package magit :ensure t)

(provide 'src/tools)
;;; tools.el ends here
