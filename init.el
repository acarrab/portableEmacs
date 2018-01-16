(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("f6a935e77513ba40014aa8467c35961fdb1fc936fa48407ed437083a7ad932de" "65d9573b64ec94844f95e6055fe7a82451215f551c45275ca5b78653d505bc42" "7f3ef7724515515443f961ef87fee655750512473b1f5bf890e2dc7e065f240c" "2b6bd2ebad907ee42b3ffefa4831f348e3652ea8245570cdda67f0034f07db93" "bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" "b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" "dd2346baba899fa7eee2bba4936cfcdf30ca55cdc2df0a1a4c9808320c4d4b22" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (yasnippet-snippets typescript-tslint yasnippet yasnippets-snippets json-mode sr-speedbar jsx-mode git-gutter+ markdown-mode+ gruvbox-theme zenburn-theme neotree nav dired-subtree treemacs dired-sidebar vlf ein bison-mode tide js3-mode git-timemachine yoshi-theme which-key web-mode virtualenv use-package tuareg try suscolors-theme smex smart-mode-line-powerline-theme shader-mode rainbow-delimiters ox-twbs ox-gfm org-bullets org-beautify-theme org-babel-eval-in-repl ob-ipython moe-theme mode-icons markdown-mode magit jedi ivy-hydra importmagic highlight-parentheses git-gutter-fringe forecast ess ein-mumamo edit-server dired-k counsel company colonoscopy-theme babel anaconda-mode)))
 '(scroll-bar-mode nil)
 '(standard-indent 2)
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 16777215)) (:background "#282828" :foreground "#fdf4c1")) (((class color) (min-colors 255)) (:background "#262626" :foreground "#ffffaf")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)




(package-initialize)
(require 'org)
(require 'ob-tangle)
(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader.org" init-dir))
;; Added by Emacs
