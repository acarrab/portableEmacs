
(defun remove-comments ()
  (interactive)
  (setq counter 0)
  (while (string-match  ";+.*\n" (current-buffer))
    (setq counter (+ 'counter 1))
    (message "There was a match number %d." 'counter)
    )
  )
(current-buffer)#<buffer test.el>
(point)253
(buffer-name)"test.el"
(buffer-file-name)"/home/acarrab/.emacs.d/test.el"
(buffer-size)480


;global test key
(global-set-key (kbd "C-c t") 'remove-comments)
(message "The name of this buffer is %s. %s." (buffer-name) "Banana")
