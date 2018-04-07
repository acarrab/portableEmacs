;;; src/project-views --- Creates project view
;;; Commentary:
;;; Code:


(require 'cl)

(defun multi-term-kill-all ()
  "Kill all multi-term processes with ctrl+c ctrl+d."
  (interactive)
  (defun is-useless-buffer (buffer)
    (let ((name (buffer-name buffer)))
      (and (= ?* (aref name 0)) (string-match "\*terminal<[0-9]+>\*" name))))

  (loop for buffer being the buffers
	do (and
	    (is-useless-buffer buffer)
	    (progn (switch-to-buffer buffer) (term-send-raw-string "\C-c") (term-send-raw-string "\C-d"))
	    )
	)
  )


(defun find-first-file-in-directories-above (file)
  "Return FILE in current or above directory."
  (defun reduce-directory (s) (replace-regexp-in-string "[^/]*/?$" "" s))
  (defun get-file-or-null (searching-directory)
    (if (not searching-directory) nil
      (if (file-exists-p (expand-file-name file searching-directory))
	  (expand-file-name file searching-directory)
	(if (or (string= searching-directory "/") (string= searching-directory "")) nil
	  (get-file-or-null (reduce-directory searching-directory))
          )
	)
      )
    )
  (get-file-or-null default-directory)
  )

(defun multi-term-and-run (process-string)
  "Run a multi-term processes then run PROCESS-STRING command inside of it."
  (multi-term)
  (term-send-raw-string (concat process-string "\n"))
  )



(defun create-view ()
  "Create default view for the current project."

  (interactive)


  (defun shrink-my-window-vertical (win cols)
    (window-resize win (window-resizable win -10000))
    (window-resize win (window-resizable win cols))
    )
  (defun shrink-my-window-horizontal (win cols)
    (window-resize win (window-resizable win -10000 t) t)
    (window-resize win (window-resizable win cols t) t)
    )
  (defun shrink-my-window (win horizontal)
    (if horizontal
	(shrink-my-window-horizontal win 40)
      (shrink-my-window-vertical win 10)
      )
    )


  (defun generate-view-config-file ()
    (message "No .view.el file was found. Making config view file...")
    (find-file (expand-file-name ".view.el"))
    (erase-buffer)
    (insert "(setq project-script-commands '())")
    (newline nil)
    (insert "(setq project-files-to-open '())")
    (forward-line -1)
    (move-end-of-line nil)
    (backward-char)
    (backward-char)
    )

  (defun generate-view-from-file (config-file project-base-directory)
    (load-file config-file)

    (multi-term-kill-all)

    (if (treemacs--is-visible?) (delete-window (treemacs--is-visible?)))
    (delete-other-windows)
    (when project-script-commands
      (progn
	(setq right (y-or-n-p "Put the terminals to the right (default is bottom)? "))
	(delete-other-windows)
	)
      )
    ;;(kill-matching-buffers "\*terminal<[0-9]*>\*")
    (find-file project-base-directory)
    (if (y-or-n-p "Use Treemacs? ") (progn (treemacs) (other-window 1)))



    ;; split into user files and terminal view

    (defun open-user-files (project-files-list)
      "opens users files."
      (when project-files-list
	(find-file (car project-files-list))
	(if (cdr project-files-list) (split-window-horizontally))
	(other-window 1)
	(open-user-files (cdr project-files-list))
	)
      )
    ;; terminal windows
    (defun create-terminals (cmds)
      "creates terminals and stops 1 past last terminal"
      (when cmds
	(multi-term-and-run (concat (concat "cd " project-base-directory) (concat " && " (car cmds))))
	(if (cdr cmds)
	    (if right (split-window-vertically) (split-window-horizontally))
	  (progn (balance-windows) (shrink-my-window (get-buffer-window) right))
	  )
	(other-window 1)
	(create-terminals (cdr cmds))
	)
      )

    (when project-script-commands
      (if right   (split-window-horizontally) (split-window-vertically))
      )
    (open-user-files project-files-to-open)
    (create-terminals project-script-commands)
    )

  (setq config-file (find-first-file-in-directories-above ".view.el"))
  (if (not config-file) (generate-view-config-file)
    (generate-view-from-file config-file
			     (setq project-base-directory (replace-regexp-in-string "/[^/]*$" "" config-file))
			     )
    )
  )

(global-set-key (kbd "C-c v") 'create-view)


(provide 'src/project-views)
;;; project-views.el ends here
