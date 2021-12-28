;;; INITIAL SETUP
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
;(menu-bar-mode -1)          ; Disable the menu bar

(setq visible-bell t)       ; Set up the visible bell

(defalias 'yes-or-no-p 'y-or-n-p)   

(setq use-dialog-box nil)   ;???
(setq use-file-dialog nil)  ;???
(setq make-backup-files nil)   ; no backup files anymore

(set-face-attribute 'default nil :font "Fira Code Retina" :height 120)
(column-number-mode)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; Initialize PACKAGE sources [[
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
;;; END Initialize package sources ]]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package command-log-mode)    ; gives some info in the command line

;;; counsel & ivy improve some commands
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; don't start searches with ^

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))

;; gives a definition of possible commands
(use-package ivy-rich
  :init (ivy-rich-mode 1))
;;; END ivy & counsel

;; describes which keys are available
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.8))

;; improved HELP for emacs
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-nord-light t)
  (doom-themes-visual-bell-config))

;(use-package gruvbox-theme
;  :config (load-theme 'gruvbox t))

;;; UNDO
;; vim style undo
(use-package undo-fu)

;;; vim bindings
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  ;(setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1)) 

;;; vim bindings everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

;;; modules for projects
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/scripting")
    (setq projectile-project-search-path '("~/scripting")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;(use-package evil-magit
;  :after magit)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(with-eval-after-load 'org-faces (dolist (face '((org-level-1 . 1.2)
		(org-level-2 . 1.1)
		(org-level-3 . 1.05)
		(org-level-4 . 1.0)
		(org-level-5 . 1.1)
		(org-level-6 . 1.1)
		(org-level-7 . 1.1)
		(org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face))))

(use-package howdoi)
(use-package mini-frame
  :ensure t
  :custom
  (mini-frame-mode t)
  ;(mini-frame-standalone t)
  (mini-frame-show-parameters '((left . 0.5) (top . 0.4) (width . 0.9) (height . 1)))
  (mini-frame-completions-show-parameters '((height . 0.5) (width . 0.5) (left . 0.5))))
;;; radio
(use-package eradio
  :ensure t)

(setq eradio-channels '(
    ("BRF 1"         . "http://streaming.brf.be:80/brf1-high.mp3")
    ("Radio Contact" . "http://audiostream.rtl.be/contactfr")
    ("Ujala"         . "http://stream2.ujala.nl/stream/2/listen.mp3")))

;;; LISPs
;(use-package racket-mode)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package paredit
  :config  (paredit-mode t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "e6f3a4a582ffb5de0471c9b640a5f0212ccf258a987ba421ae2659f1eaa39b09" "850bb46cc41d8a28669f78b98db04a46053eca663db71a001b40288a9b36796c" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "4b6b6b0a44a40f3586f0f641c25340718c7c626cbf163a78b5a399fbe0226659" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "b5803dfb0e4b6b71f309606587dd88651efe0972a5be16ece6a958b197caeed8" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "b186688fbec5e00ee8683b9f2588523abdf2db40562839b2c5458fcfb322c8a4" "4f1d2476c290eaa5d9ab9d13b60f2c0f1c8fa7703596fa91b235db7f99a9441b" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "3d54650e34fa27561eb81fc3ceed504970cc553cfd37f46e8a80ec32254a3ec3" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" default))
 '(newsticker-url-list-defaults
   '(("Emacs Wiki" "https://www.emacswiki.org/emacs?action=rss" nil 3600)
     ("Tagesschau (german)" "http://www.tagesschau.de/newsticker.rdf" nil 1800)))
 '(package-selected-packages
   '(dired-hacks-utils dired-rainbow mini-frame geiser-racket geiser-guile org-bullets evil-magit magit counsel-projectile projectile helpful counsel ivy-rich which-key rainbow-delimiters org-roam racket-mode eradio howdoi gruvbox-theme evil-collection evil use-package ivy doom-themes doom-modeline command-log-mode))
 '(safe-local-variable-values '((projectile-project-run-cmd . "racket"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
