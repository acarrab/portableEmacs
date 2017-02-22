(setq top-level '(normal-top-level))

;installpackage org

(defvar command-line-processed nil
  "Non-nil once command line has been processed.")

(defgroup initialization nil
  "Emacs start-up procedure."
  :group 'environment)

(defcustom inhibit-startup-screen nil
  "Non-nil inhibits the startup screen.

This is for use in your personal init file (but NOT site-start.el),
once you are familiar with the contents of the startup screen."
  :type 'boolean
  :group 'initialization)

(defvaralias 'inhibit-splash-screen 'inhibit-startup-screen)
(defvaralias 'inhibit-startup-message 'inhibit-startup-screen)

(require 'package)
(setq package-enable-at-startup nil)
;; Load packages from online
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package try
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
;; Swiper addition with ivy

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;;;;;;;;;;;;;;;;;;;;;;;; AutoComplete  ;;;;;;;;;;;;;;;;;;;;;;;;
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))
;;;;;;;;;;;;;;;;;;;;;;;; Rainbow Delimiters ;;;;;;;;;;;;;;;;;;;;;;;;
(use-package rainbow-delimiters
  :ensure t
  )
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'rainbow-delimiters)
(setq git-gutter-fr:side 'right-fring)

;;;;;;;;;;;;;;;;;;;;;;;; ORG MODE ;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-startup-with-inline-images t)


;;;;;;;;;;;;;;;;;;;;;;;; Preference ;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8)



;;;;;;;;;;;;;;;;;;;;;;;; Some Git ;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit :ensure t)
(use-package dired-k :ensure t)
(use-package git-gutter-fringe :ensure t)
(require 'git-gutter-fringe)
(global-git-gutter-mode +1)
(setq git-gutter-fr:side 'right-fringe)

;;;;;;;;;;;;;;;;;;;;;;; Jump around Windows ;;;;;;;;;;;;;;;;
(use-package ace-window :ensure t)
(global-set-key (kbd "M-p") 'ace-window)

;;;;;;;;;;;;;;;;;;;;;;;; Major-Modes ;;;;;;;;;;;;;;;;;;;;;;;
;;----------- R editing -------------------
(use-package ess :ensure t)
;;----------- Shader editing --------------
(use-package shader-mode :ensure t)
;;----------- Python additions ------------
(use-package anaconda-mode :ensure t)
;;----------- IPython! --------------------
(use-package ein  :ensure t)
;;------------ Fix python imports with ----
(use-package importmagic :ensure t)
;;------------ Setting to ide -------------
(use-package virtualenv :ensure t)
(use-package edit-server :ensure t)
(use-package jedi :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;; Adds my theme ;;;;;;;;;;;;;;;;;;;;;
(use-package suscolors-theme
  :ensure t)
;;;;;;;;;;;;;;;;;;;; Smaller Customization ;;;;;;;;;;;;;;;;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)




(require 'server)
(unless (server-running-p)(server-start))
;; Added by Emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-enabled-themes (quote (suscolors)))
 '(custom-safe-themes
   (quote
    ("b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" default)))
 '(inhibit-default-init t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen nil)
 '(initial-major-mode (quote org-mode))
 '(initial-scratch-message "
* Welcome To Emacs
")
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 100 :width normal :powerline-scale 1.1)))))
