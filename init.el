(package-initialize)
(require 'org)
(require 'ob-tangle)
(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader.org" init-dir))
;; Added by Emacs


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
    ("b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" default)))
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
    (org-beautify-theme ox-gfm ox-twbs forecast which-key web-mode virtualenv use-package try suscolors-theme smex shader-mode rainbow-delimiters powerline org-bullets org-babel-eval-in-repl ob-ipython mode-icons magit jedi ivy-hydra importmagic highlight-parentheses git-gutter-fringe ess ein-mumamo edit-server dired-k counsel babel anaconda-mode)))
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
