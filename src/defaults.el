;;; src/defaults --- This should be loaded first
;;; Commentary:
;;; Code:



(require 'package)
;; add package archives
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

;; add short hand loading procedure for downloading things from repo's
(unless (package-installed-p 'use-package) (package-refresh-contents) (package-install 'use-package))
(require 'use-package)

;; Use emacs server to decrease load time when opening emacs a second time ;;;;
(require 'server)
(unless (server-running-p) (server-start))

;; modern file manipulation ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package f :ensure t)
(require 'f)

;; adds new syntax
(use-package try :ensure t)

;; add in suggestions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package which-key :ensure t :config (which-key-mode))

;; add searching recommendations.. to everything ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package counsel :ensure t :bind ("M-y" . councel-yank-pop))
(use-package smex :ensure t)
(use-package swiper :ensure t
  :config (progn
	    (ivy-mode 1)
	    (setq ivy-use-virtual-buffers t)
	    )
  :bind (("C-s" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("<f6>" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("<f1> f" . counsel-describe-function)
	 ("<f1> v" . counsel-describe-variable)
	 ("<f1> l" . counsel-load-library)
	 ("<f2> i" . counsel-info-lookup-symbol)
	 ("<f2> u" . counsel-unicode-char)
	 ("C-c g" . counsel-git)
	 ("C-c j" . counsel-git-grep)
	 ("C-c k" . counsel-ag)
	 ("C-x l" . counsel-locate)
	 ("C-S-o" . counsel-rhythmbox)
	 :map read-expression-map
	 ("C-r" .  counsel-expression-history))
  )




(provide 'src/defaults)
;;; defaults.el ends here
