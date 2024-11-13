(setq inhibit-startup-message t)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(load-theme 'modus-vivendi t)

(set-face-attribute 'default nil :height 150)

(setq visible-bell t)

;; buffer fix
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Melpa setup
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  )

