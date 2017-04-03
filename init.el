(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (suscolors)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (yoshi-theme which-key web-mode virtualenv use-package tuareg try suscolors-theme smex smart-mode-line-powerline-theme shader-mode rainbow-delimiters ox-twbs ox-gfm org-bullets org-beautify-theme org-babel-eval-in-repl ob-ipython moe-theme mode-icons markdown-mode magit jedi ivy-hydra importmagic highlight-parentheses git-gutter-fringe forecast ess ein-mumamo edit-server dired-k counsel company colonoscopy-theme babel anaconda-mode)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 140 :width normal :powerline-scale 1.1)))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)




(package-initialize)
(require 'org)
(require 'ob-tangle)
(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader.org" init-dir))
;; Added by Emacs
