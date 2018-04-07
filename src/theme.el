;;; src/theme --- Loads the theme that is wanted for emacs
;;; Commentary:
;;; Code:



(use-package suscolors-theme :ensure t)
(use-package gruvbox-theme :ensure t)


(use-package smart-mode-line :ensure t :init (setq sml/theme 'dark)
  :config (progn
	    (setq sml/no-confirm-load-theme t)
	    (sml/setup)
	    (add-to-list 'sml/replacer-regexp-list '("g(.*)home/acarrab/" ":Palmetto:") t)
	    (add-to-list 'sml/replacer-regexp-list  '("^~/Desktop/courses/\\(\\w+\\)/"
						      (lambda (s) (concat ":" (upcase (match-string 1 s)) ":")))
			 t)
	    (add-to-list 'sml/replacer-regexp-list  '("^~/Desktop/\\(\\w+\\)/"
						      (lambda (s) (concat ":" (upcase (match-string 1 s)) ":")))
			 t)
	    (setf rm-blacklist "[\(company\)\(ivy\)\(WK\)]")
	    )
  )


;; Highlight matching parenthesis ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package highlight-parentheses :ensure t
  :diminish highlight-parentheses-mode
  :hook emacs-lisp-mode
  :init (global-highlight-parentheses-mode)
  )

;; Color all delimiters
(use-package rainbow-delimiters :ensure t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'rainbow-delimiters)


(require 'org)


(setq-default org-startup-with-inline-images t)
(setq-default org-ellipsis " »")
(setq-default org-todo-keyword-faces
	      '(("TODO" . (:foreground "teal" :weight bold)) ("STARTED" . "yellow")
		("DONE" . (:foreground "green" :weight bold))))
(setq-default org-src-fontify-natively t)
(setq-default org-src-tab-acts-natively t)
(setq-default org-log-done 'time)

(use-package org-bullets :ensure t
  :hook (org-mode . org-bullets-mode)
  :config (progn (setq org-bullets-face-name (quote org-bullet-face))
		 (setq org-bullets-bullet-list '("◎" "✥" "❂" "✛" "✱" "✻" "⎈" "✛"))
		 )
  )



(org-babel-do-load-languages 'org-babel-load-languages '((python . t) (latex . t)))
(setq-default org-highlight-latex-and-related '(latex script entities))

(if (display-graphic-p)
    (progn
      (use-package git-gutter-fringe :ensure t)
      (require 'git-gutter-fringe)

      (setq-default left-fringe-width 20)
      (setq-default right-fringe-width 20)

      (global-git-gutter-mode +1)
      (add-hook 'find-file-hook 'linum-mode)
      )
  (progn
    (use-package git-gutter :ensure t)
    (require 'git-gutter)
    (global-git-gutter-mode +1)
    (git-gutter:linum-setup)
    (custom-set-variables
     '(git-gutter:modified-sign "  ") ;; two space
     '(git-gutter:added-sign "++")    ;; multiple character is OK
     '(git-gutter:deleted-sign "--"))
    (set-face-background 'git-gutter:modified "purple") ;; background color
    (set-face-foreground 'git-gutter:added "green")
    (set-face-foreground 'git-gutter:deleted "red")
    )
  )

(use-package spaceline :ensure t
  :init (progn
	  (spaceline-emacs-theme)
	  (spaceline-info-mode)
	  )
  )


(when (window-system)
  (set-default-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
	       ;; crashes cpp mode: (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
	       ;; crashes eshell:   (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
	       ;; hasn't crashed yet, reported to crash with helm integration:  (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
	       ;; crashes cpp mode: (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

  (let ((class '((class color) (min-colors 89)))
        ;; Palette colors.
        (yellow-1 "#fce94f") (yellow-2 "#ffd700") (yellow-3 "#c4a000") (yellow-3-5 "#aaaa11") (yellow-4 "#875f00")
        (orange-1 "#ffaf5f") (orange-2 "#ff8700") (orange-3 "#ff5d17") (orange-4 "#d75f00") (orange-5 "#af5f00")
        (magenta-1 "#ff7bbb") (magenta-2 "#ff4ea3") (magenta-3 "#ff1f8b")
        (green-1 "#afff00") (green-2 "#a1db00") (green-3 "#5faf00") (green-4 "#008700") (green-5 "#005f00")
        (cyan-1 "#87ffff") (cyan-2 "#87d7af") (cyan-3 "#00d7af") (cyan-4 "#00ac8a") (cyan-5 "#5faf87") (cyan-6 "#005f5f") (cyan-7 "#236f73")
        (blue-1 "#5fafd7") (blue-2 "#1f5bff") (blue-3 "#005f87") (blue-4 "#005faf") (blue-5 "#0000af") (blue-6 "#00005f")
        (purple-1 "#d18aff") (purple-2 "#af5fff") (purple-3 "#9a08ff") (purple-4 "#6c0099")
        (red-1 "#ef2929")  (red-2 "#dd0000")  (red-3 "#a40000") (red-4 "#5f0000")
        (white-1 "#c6c6c6") (white-2 "#c6c6c6") (white-3 "#b2b2b2") (black-1 "#a8a8a8") (black-2 "#8a8a8a")
        (black-2-5 "#6c6c6c") (black-3 "#4e4e4e") (black-4 "#3a3a3a") (black-5 "#303030") (black-6 "#000000")
        (LIGHT_BG "#fdfde7") (white-0 "#eeeeee")
        (green-02 "#5fd700") (green-01 "#d7ff00") (green-0 "#d7ff5f") (green-00 "#d7ff87")
        (cyan-0 "#d7ffd7")
        (blue-01 "#c3c9f8") (blue-0 "#afd7ff") (blue-00 "#d7d7ff")
        (yellow-0 "#ffff87") (yellow-00 "#ffffaf")
        (purple-0 "#af87ff") (purple-00 "#e6a8df")
        (red-0 "#ff4b4b") (red-00 "#ffafaf")
        (magenta-0 "#ffafd7") (magenta-00 "#ffd7ff")
        (orange-0 "#ffaf87") (orange-00 "#ffd787") (orange-000 "#ffd7af")
        (linum-dark "#87875f") (linum-light "#d7d7af")
        )


    (custom-theme-set-faces
     'suscolors

     ;; org-mode
     `(org-code ((,class (:foreground ,blue-1 :background ,black-4))))
     `(org-link ((,class (:foreground ,blue-1 :underline t))))

     `(org-priority ((,class (:foreground ,red-1 :background ,nil))))
     `(org-block ((,class (:foreground ,blue-1 :background ,black-4))))
     `(org-block-background ((,class (:foreground nil :background ,black-5))))
     `(org-block-begin-line ((,class (:foreground ,white-0 :background ,cyan-6))))
     `(org-block-end-line ((,class (:foreground ,black-3 :background nil))))
     )
    )


(provide 'src/theme)
;;; theme.el ends here
