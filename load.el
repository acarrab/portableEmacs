
;; (require 'cl)
;; (setq tls-checktrust t)

;; (setq python (or (executable-find "py.exe")
;;                  (executable-find "python")
;;                  ))

;; (let ((trustfile
;;        (replace-regexp-in-string
;;         "\\\\" "/"
;;         (replace-regexp-in-string
;;          "\n" ""
;;          (shell-command-to-string (concat python " -m certifi"))))))
;;   (setq tls-program
;;         (list
;;          (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
;;                  (if (eq window-system 'w32) ".exe" "") trustfile)))
;;   (setq gnutls-verify-error t)
;;   (setq gnutls-trustfiles (list trustfile)))

(require 'package)

(setq package-archives nil)
;; Load packages from online
(setq package-archives '(("gnu"          . "https://elpa.gnu.org/packages/")
                         ("melpa"        . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org"       . "http://orgmode.org/elpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package try :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(setq org-startup-with-inline-images t)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

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

(use-package ivy-hydra :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;; AutoComplete  ;;;;;;;;;;;;;;;;;;;;;;;;
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package ace-window :ensure t)
(global-set-key (kbd "M-p") 'ace-window)

(use-package magit :ensure t)
(use-package dired-k :ensure t)
(use-package git-gutter-fringe :ensure t)
(require 'git-gutter-fringe)
(global-git-gutter-mode +1)
(setq git-gutter-fr:side 'right-fringe)

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

(use-package ess :ensure t)

(use-package shader-mode :ensure t)

(use-package web-mode :ensure t)



(use-package highlight-parentheses
  :ensure t
  :diminish highlight-parentheses-mode
  :config
  (add-hook 'emacs-lisp-mode-hook
            (lambda() (highligh-parentheses-mode))))
(global-highlight-parentheses-mode)

;;;;;;;;;;;;;;;;;;;;;;;; Rainbow Delimiters ;;;;;;;;;;;;;;;;;;;;;;;;
(use-package rainbow-delimiters
  :ensure t
  )
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'rainbow-delimiters)

;;;;;;;;;;;;;;;;;;;;;;;; Preference ;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package suscolors-theme :ensure t)

(require 'server)
(unless (server-running-p)(server-start))

(defun my-bell-function())
(setq ring-bell-function 'my-bell-function)
(setq visible-bell nil)
