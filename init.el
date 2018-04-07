;;; init --- init package for portableEmacs
;;; Commentary:
;;; Code:

(defvar portable-emacs-dir)
(setq portable-emacs-dir (file-name-directory (or load-file-name (buffer-file-name))))


;; load yasnippet directory
(setq-default yas-files (expand-file-name "yasnippet" portable-emacs-dir))
(setq-default yas-snippet-dirs '(yas-files))


(defvar portable-emacs-load-order)
(setq portable-emacs-load-order '("src/defaults.el"
				  "src/emacs-behavior.el"
				  "src/theme.el"
				  "src/tools.el"
				  "src/project-views.el"
				  "src/languages/webdev.el"
				  "src/languages/python.el"
				  "src/languages/cpp.el"))

(defun load-portable-emacs (load-order)
  "Load portableEmacs given the LOAD-ORDER."
  (when load-order
    (load-file (expand-file-name (car load-order) portable-emacs-dir))
    (load-portable-emacs (cdr load-order))
    )
  )

(load-portable-emacs portable-emacs-load-order)




;;; init.el ends here
