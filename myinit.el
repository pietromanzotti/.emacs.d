;; [[file:~/.emacs.d/myinit.org::*Repository][Repository:1]]
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/")
                               '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)
;; Repository:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Interface][Interface:1]]
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(toggle-frame-fullscreen)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
(delete-other-windows)
(split-window-right)
(windmove-right)
(split-window-below)
(windmove-down)
(eshell)
;; Interface:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Theme][Theme:1]]
(use-package zenburn-theme
:ensure t
:config
(load-theme 'zenburn t))
;; Theme:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Try][Try:1]]
(use-package try
:ensure t)
;; Try:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Which%20Key][Which Key:1]]
(use-package which-key
:ensure t 
:config
(which-key-mode))
;; Which Key:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Org-mode][Org-mode:1]]
(use-package org-bullets
:ensure t
:config 
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(org-babel-do-load-languages
'org-babel-load-languages
'(
  (C . t)
  (emacs-lisp . t)
  (js . t)
  (python . t)
  ))
;; Org-mode:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Swiper%20/%20Ivy%20/%20Counsel][Swiper / Ivy / Counsel:1]]
(use-package counsel
:ensure t
:bind
(("M-y" . counsel-yank-pop)
:map ivy-minibuffer-map
("M-y" . ivy-next-line)))

(use-package ivy
:ensure t
:diminish (ivy-mode)
:bind (("C-x b" . ivy-switch-buffer))
:config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "%d/%d ")
(setq ivy-display-style 'fancy))

(use-package swiper
:ensure t
:bind (("C-s" . swiper-isearch)
       ("C-r" . swiper-isearch)
       ("C-c C-r" . ivy-resume)
       ("M-x" . counsel-M-x)
       ("C-x C-f" . counsel-find-file))
:config
(progn
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ))
;; Swiper / Ivy / Counsel:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Avy][Avy:1]]
(use-package avy
:ensure t
:bind ("C-M-s" . avy-goto-word-1)) ;; changed from char as per jcs
;; Avy:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Flycheck][Flycheck:1]]
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;; Flycheck:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Yasnippet][Yasnippet:1]]
(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))
(use-package yasnippet-snippets
  :ensure t)
;; Yasnippet:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Undo%20Tree][Undo Tree:1]]
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))
;; Undo Tree:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Web%20Mode][Web Mode:1]]
(use-package web-mode
    :ensure t
    :config
	 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	 (setq web-mode-engines-alist
	       '(("django"    . "\\.html\\'")))
	 (setq web-mode-ac-sources-alist
	 '(("css" . (ac-source-css-property))
         ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq web-mode-enable-auto-closing t))
(setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned
;; Web Mode:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Emmet%20mode][Emmet mode:1]]
(use-package emmet-mode
:ensure t
:config
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
)
;; Emmet mode:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Dired][Dired:1]]
; wiki melpa problem
;(use-package dired+
;  :ensure t
;  :config (require 'dired+)
;  )

(setq dired-dwim-target t)

(use-package dired-narrow
:ensure t
:config
(bind-key "C-c C-n" #'dired-narrow)
(bind-key "C-c C-f" #'dired-narrow-fuzzy)
(bind-key "C-x C-N" #'dired-narrow-regexp)
)

(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))
;; Dired:1 ends here

;; [[file:~/.emacs.d/myinit.org::*IBuffer][IBuffer:1]]
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("org" (name . "^.*org$"))
               ("magit" (mode . magit-mode))
               ("IRC" (or (mode . circe-channel-mode) (mode . circe-server-mode)))
               ("web" (or (mode . web-mode) (mode . js2-mode)))
               ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
               ("mu4e" (or

                        (mode . mu4e-compose-mode)
                        (name . "\*mu4e\*")
                        ))
               ("programming" (or
                               (mode . clojure-mode)
                               (mode . clojurescript-mode)
                               (mode . python-mode)
                               (mode . c++-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))

;; don't show these
                                        ;(add-to-list 'ibuffer-never-show-predicates "zowie")
;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)
;; IBuffer:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Rust][Rust:1]]
(use-package rust-mode
:ensure t)
;; Rust:1 ends here

;; [[file:~/.emacs.d/myinit.org::*Clojure/ClojureScript][Clojure/ClojureScript:1]]
(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :init
  (add-hook 'clojure-mode-hook #'yas-minor-mode)         
  (add-hook 'clojure-mode-hook #'linum-mode)             
  (add-hook 'clojure-mode-hook #'subword-mode)           
  (add-hook 'clojure-mode-hook #'smartparens-mode)       
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'eldoc-mode)             
  (add-hook 'clojure-mode-hook #'idle-highlight-mode))

(use-package cider
  :ensure t
  :defer t
  :init (add-hook 'cider-mode-hook #'clj-refactor-mode)
  :diminish subword-mode
  :config
  (setq nrepl-log-messages t                  
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t    
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        nrepl-hide-special-buffers t            
        cider-overlays-use-font-lock t)         
  (cider-repl-toggle-pretty-printing))

(use-package smartparens-config
  :ensure smartparens
  :config (progn (show-smartparens-global-mode t)))

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

(use-package cider-eval-sexp-fu
  :defer t)

(use-package clj-refactor
  :defer t
  :ensure t
  :diminish clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-m"))

(bind-keys
 :map smartparens-mode-map
 ("C-M-a" . sp-beginning-of-sexp)
 ("C-M-e" . sp-end-of-sexp)

 ("C-<down>" . sp-down-sexp)
 ("C-<up>"   . sp-up-sexp)
 ("M-<down>" . sp-backward-down-sexp)
 ("M-<up>"   . sp-backward-up-sexp)

 ("C-M-f" . sp-forward-sexp)
 ("C-M-b" . sp-backward-sexp)

 ("C-M-n" . sp-next-sexp)
 ("C-M-p" . sp-previous-sexp)

 ("C-S-f" . sp-forward-symbol)
 ("C-S-b" . sp-backward-symbol)

 ("C-<right>" . sp-forward-slurp-sexp)
 ("M-<right>" . sp-forward-barf-sexp)
 ("C-<left>"  . sp-backward-slurp-sexp)
 ("M-<left>"  . sp-backward-barf-sexp)

 ("C-M-t" . sp-transpose-sexp)
 ("C-M-k" . sp-kill-sexp)
 ("C-k"   . sp-kill-hybrid-sexp)
 ("M-k"   . sp-backward-kill-sexp)
 ("C-M-w" . sp-copy-sexp)
 ("C-M-d" . delete-sexp)

 ("M-<backspace>" . backward-kill-word)
 ("C-<backspace>" . sp-backward-kill-word)
 ([remap sp-backward-kill-word] . backward-kill-word)

 ("M-[" . sp-backward-unwrap-sexp)
 ("M-]" . sp-unwrap-sexp)

 ("C-x C-t" . sp-transpose-hybrid-sexp)

 ("C-c ("  . wrap-with-parens)
 ("C-c ["  . wrap-with-brackets)
 ("C-c {"  . wrap-with-braces)
 ("C-c '"  . wrap-with-single-quotes)
 ("C-c \"" . wrap-with-double-quotes)
 ("C-c _"  . wrap-with-underscores)
 ("C-c `"  . wrap-with-back-quotes))
;; Clojure/ClojureScript:1 ends here
