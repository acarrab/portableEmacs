;;; src/emacs-behavior --- overwriting default emacs behavior
;;; Commentary:
;;; Code:



(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq ring-bell-function (lambda () ()))
(setq visible-bell nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


(require 're-builder)
(setq reb-re-syntax 'string)

;; fix inaccessible functions in shell for mac-os platform ;;;;;;;;;;;;;;;;;;;;
(use-package exec-path-from-shell :ensure t)
(when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize))


(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat user-emacs-directory "backups")))))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name (concat user-emacs-directory "autosaves")) t)))


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


(provide 'src/emacs-behavior)
;;; emacs-behavior.el ends here
