;;; src/languages/webdev --- all webdev related settings
;;; Commentary:
;;; Code:


(use-package flycheck :ensure t)
(use-package typescript :ensure t)
(use-package tide :ensure t
  :init (flycheck-add-mode 'typescript-tslint 'web-mode)
  :hook '((typescript-mode-hook . tide-mode)
	  (before-save-hook . tide-format-before-save))
  )

(defun setup-tide-mode ()
  "Activates tide mode with additional configuration."
  (tide-setup)
  (flycheck-mode +1)
  (setq-default flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  )
(defun setup-tide-mode-when-tsx ()
  "Activates tide mode with tsx configuration."
  (when (string-equal "tsx" (file-name-extension buffer-file-name))
    (setup-tide-mode))
  )


(use-package web-mode :ensure t
  :init (progn
	  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
	  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
	  )
  )



(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)


(provide 'src/languages/webdev)
;;; webdev.el ends here
