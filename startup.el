(defun myCustomStartup ()
  "Custom startup file"
  (interactive)
  (switch-to-buffer "StArTuP")
  (StartuP-init)
  )

(defvar StartuP-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\RET" 'org-open-at-point)
    (define-key map "\M-m\f"  'org-open-at-point)
    map)
  "Keymap for 'StartuP-mode.")

(define-derived-mode StartuP-mode org-mode "StArTuP-mode"
  "Major mode for startup.
\\{StartuP-mode-map})"
  (setq case-fold-search nil))

(add-hook 'StartuP-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "RET") 'org-open-at-point))
	  )

(defun StartuP-init ()
  "What startup does"
  (StartuP-mode)
  (read-only-mode)
  (loadOrgFile "~/.emacs.d/emacsWelcome.org")
   )


(defun loadOrgFile (fileName)
  (let ((inhibit-read-only t))
    (insert-file (expand-file-name fileName))
  ))
