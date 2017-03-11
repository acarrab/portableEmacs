(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" "ac5584b12254623419499c3a7a5388031a29be85a15fdef9b94df2292d3e2cbb" "b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" default)))
 '(debug-on-error t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(inhibit-default-init t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote org-mode))
 '(initial-scratch-message nil)
 '(package-selected-packages
   (quote
    (smart-mode-line-light-powerline-theme smart-mode-line-powerline-theme smart-mode-line colonoscopy-theme org-beautify-theme ox-gfm ox-twbs forecast which-key web-mode virtualenv use-package try suscolors-theme smex shader-mode rainbow-delimiters powerline org-bullets org-babel-eval-in-repl ob-ipython mode-icons magit jedi ivy-hydra importmagic highlight-parentheses git-gutter-fringe ess ein-mumamo edit-server dired-k counsel babel anaconda-mode)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 163 :width normal :powerline-scale 1.1)))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)



(package-initialize)
(require 'org)
(require 'ob-tangle)
(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader.org" init-dir))
;; Added by Emacs
