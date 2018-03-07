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
    ("2e1d19424153d41462ad31144549efa41f55dacda9b76571f73904612b15fd0a" "73e35ffa5ca98b57a9923954f296c3854ce6d8736b31fdbdda3d27502d4b4d69" "77bddca0879cb3b0ecdf071d9635c818827c57d69164291cb27268ae324efa84" "3481e594ae6866d72c40ad77d86a1ffa338d01daa9eb0977e324f365cef4f47c" "6be42070d23e832a7493166f90e9bb08af348a818ec18389c1f21d33542771af" "554b7f0439155d6eb648d4837ef03902f51124cacee021217e76f39e9dd314c2" "a7e7804313dbf827a441c86a8109ef5b64b03011383322cbdbf646eb02692f76" "0a3a41085c19d8121ed0ad3eb658a475ccb948a70a83604641ee7d4c3575a4d5" "d0404bd38534a00ee72a4f887a987d6bff87f4cf8d8f85149e32849b262465a5" "c63a789fa2c6597da31f73d62b8e7fad52c9420784e6ec34701ae8e8f00071f6" "b67cb8784f6a2d1a3f605e39d2c376937f3bf8460cb8a0d6fc625c0331c00c83" "8e4efc4bed89c4e67167fdabff77102abeb0b1c203953de1e6ab4d2e3a02939a" "f6a935e77513ba40014aa8467c35961fdb1fc936fa48407ed437083a7ad932de" "65d9573b64ec94844f95e6055fe7a82451215f551c45275ca5b78653d505bc42" "7f3ef7724515515443f961ef87fee655750512473b1f5bf890e2dc7e065f240c" "2b6bd2ebad907ee42b3ffefa4831f348e3652ea8245570cdda67f0034f07db93" "bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" "b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" "dd2346baba899fa7eee2bba4936cfcdf30ca55cdc2df0a1a4c9808320c4d4b22" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(fci-rule-color "#62686E")
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f24" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f24" "#7bc275"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f24" "#484854"))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (exec-path-from-shell php-mode multi-term git-gutter-fringe doom-themes js-doc typescript yasnippet-snippets typescript-tslint yasnippet yasnippets-snippets json-mode sr-speedbar jsx-mode markdown-mode+ gruvbox-theme zenburn-theme neotree nav dired-subtree treemacs dired-sidebar vlf ein bison-mode tide js3-mode git-timemachine yoshi-theme which-key web-mode virtualenv use-package tuareg try suscolors-theme smex smart-mode-line-powerline-theme shader-mode rainbow-delimiters ox-twbs ox-gfm org-bullets org-beautify-theme org-babel-eval-in-repl ob-ipython moe-theme mode-icons markdown-mode magit jedi ivy-hydra importmagic highlight-parentheses forecast ess ein-mumamo edit-server dired-k counsel company colonoscopy-theme babel anaconda-mode)))
 '(scroll-bar-mode nil)
 '(standard-indent 2)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#1c1f24")
 '(vc-annotate-color-map
   (list
    (cons 20 "#7bc275")
    (cons 40 "#a6c677")
    (cons 60 "#d1ca79")
    (cons 80 "#FCCE7B")
    (cons 100 "#f4b96e")
    (cons 120 "#eda461")
    (cons 140 "#e69055")
    (cons 160 "#db8981")
    (cons 180 "#d082ae")
    (cons 200 "#C57BDB")
    (cons 220 "#d874b0")
    (cons 240 "#eb6d86")
    (cons 260 "#ff665c")
    (cons 280 "#d15e59")
    (cons 300 "#a35758")
    (cons 320 "#754f56")
    (cons 340 "#62686E")
    (cons 360 "#62686E")))
 '(vc-annotate-very-old-color nil)
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

;; for user defiend additions to emacs
(org-babel-load-file (expand-file-name "user.org" init-dir))
;; Added by Emacs
